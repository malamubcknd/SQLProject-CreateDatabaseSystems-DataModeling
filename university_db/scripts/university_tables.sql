CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    d_departmentname VARCHAR(50),
    faculty_id INT
);


CREATE TABLE faculties(
    faculty_id SERIAL PRIMARY KEY,
    f_facultyname VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    f_contact VARCHAR(20),
    f_officehours VARCHAR(50)
);

-- Add the foreign key constraint for the departments table later because of mutual dependencies between departments and faculties
ALTER TABLE departments
ADD CONSTRAINT added_fk_faculty_id
FOREIGN KEY (faculty_id)
REFERENCES faculties(faculty_id);


CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    c_coursename VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    c_credithours INT,
    c_prerequisites VARCHAR(50) NULL
);


CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    s_firstname VARCHAR(50),
    s_surname VARCHAR(50),
    s_enrollmentdate DATE,
    major_id INT REFERENCES courses(course_id),
    s_contact VARCHAR(20),
    s_email VARCHAR(320)
);


CREATE TABLE classroomassignment(
    ca_roomnumber VARCHAR(20),
    course_id INT REFERENCES courses(course_id),
    ca_timeslot VARCHAR(20),
    ca_maximumcapacity INT,
    CONSTRAINT classroom_id PRIMARY KEY (ca_roomnumber, ca_timeslot)
);


CREATE TABLE enrollments(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    e_enrollmentdate DATE,
    e_grade CHAR(2) CHECK (e_grade IN ('A+', 'A-','B+', 'B-','C+', 'C-','D+', 'D-','E+', 'E-','F+', 'F-'))
);





-- ADDITIONAL FEATURES

-- View for Academic Advising Module
CREATE VIEW student_advising AS
SELECT
    students.student_id,
    students.s_firstname,
    students.s_surname,
    students.major_id,
    courses.c_coursename AS major,
    courses.c_credithours,
    courses.c_prerequisites
FROM students
JOIN courses ON students.major_id = courses.course_id;

-- View for Classroom Scheduling System
CREATE VIEW classroomassignment_schedule AS
SELECT
    classroomassignment.classroom_id,
    classroomassignment.course_id,
    courses.c_coursename,
    classroomassignment.c_timeslot,
    classroomassignment.c_maximumcapacity
FROM classroomassignment
JOIN courses ON classroomassignment.course_id = courses.course_id;

-- View for Faculty Workload Management
CREATE VIEW faculty_workload AS
SELECT
    faculties.faculty_id,
    faculties.f_facultyname,
    departments.d_departmentname,
    COUNT(classroomassignment.course_id) AS teaching_load
FROM faculties
JOIN departments ON faculties.department_id = departments.department_id
LEFT JOIN courses ON courses.department_id = departments.department_id
LEFT JOIN classroomassignment ON courses.course_id = classroomassignment.course_id
GROUP BY faculties.faculty_id, departments.d_departmentname;

-- View for Student Performance Tracking
CREATE VIEW student_performance AS
SELECT
    students.student_id,
    students.s_firstname,
    students.s_surname,
    enrollments.e_grade,
    courses.c_coursename
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id;

-- Stored Procedure for Security Measures (Sample, you may need to adapt it based on your specific requirements)
CREATE OR REPLACE FUNCTION audit_access(user_id INT, table_name VARCHAR, operation VARCHAR)
RETURNS VOID AS $$
BEGIN
    -- Implement your security measures here (e.g., logging access, checking permissions, etc.)
    RAISE NOTICE 'User % accessed table % and performed % operation', user_id, table_name, operation;
END;
$$ LANGUAGE plpgsql;

-- Example Trigger to Call the Stored Procedure
CREATE OR REPLACE FUNCTION audit_access_trigger()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM audit_access(current_user_id(), TG_TABLE_NAME, TG_OP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER audit_access_trigger
BEFORE INSERT OR UPDATE OR DELETE ON students, courses, faculties, classroomassignment, enrollments, departments
FOR EACH ROW EXECUTE FUNCTION audit_access_trigger();