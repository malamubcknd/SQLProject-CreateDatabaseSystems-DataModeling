Database Documentation: Academic Management System
1. Overview

The Academic Management System database is designed to handle information related to departments, faculties, courses, students, classroom assignments, and enrollments. It includes additional features such as views for academic advising, classroom scheduling, faculty workload management, and student performance tracking. The system aims to facilitate academic processes, advising, scheduling, workload management, and performance tracking.
2. Table Descriptions
2.1 Departments Table
departments

    Columns:
        department_id (Primary Key): Unique identifier for each department.
        d_departmentname: Name of the department.
        faculty_id: Foreign key referencing the faculty associated with the department.

2.2 Faculties Table
faculties

    Columns:
        faculty_id (Primary Key): Unique identifier for each faculty.
        f_facultyname: Name of the faculty.
        department_id: Foreign key referencing the department associated with the faculty.
        f_contact and f_officehours: Contact information and office hours for the faculty.

2.3 Courses Table
courses

    Columns:
        course_id (Primary Key): Unique identifier for each course.
        c_coursename: Name of the course.
        department_id: Foreign key referencing the department associated with the course.
        c_credithours: Credit hours for the course.
        c_prerequisites: Prerequisites for the course (nullable).

2.4 Students Table
students

    Columns:
        student_id (Primary Key): Unique identifier for each student.
        s_firstname and s_surname: First and last name of the student.
        s_enrollmentdate: Date of student enrollment.
        major_id: Foreign key referencing the major course associated with the student.
        s_contact and s_email: Contact information for the student.

2.5 Classroom Assignment Table
classroomassignment

    Columns:
        ca_roomnumber: Room number for the assignment.
        course_id: Foreign key referencing the course associated with the assignment.
        ca_timeslot: Timeslot for the assignment.
        ca_maximumcapacity: Maximum capacity for the assignment.

2.6 Enrollments Table
enrollments

    Columns:
        enrollment_id (Primary Key): Unique identifier for each enrollment.
        student_id: Foreign key referencing the student associated with the enrollment.
        course_id: Foreign key referencing the course associated with the enrollment.
        e_enrollmentdate: Date of enrollment.
        e_grade: Grade received (A+, A-, B+, B-, ..., F+, F-).

3. Additional Features
3.1 Academic Advising Module
View: student_advising

    Columns:
        student_id, s_firstname, s_surname, major_id, major, c_credithours, c_prerequisites.
    Purpose:
        Provides information for academic advising, including student details, major information, credit hours, and prerequisites.

3.2 Classroom Scheduling System
View: classroomassignment_schedule

    Columns:
        classroom_id, course_id, c_coursename, c_timeslot, c_maximumcapacity.
    Purpose:
        Facilitates classroom scheduling by presenting details about assignments, courses, timeslots, and maximum capacities.

3.3 Faculty Workload Management
View: faculty_workload

    Columns:
        faculty_id, f_facultyname, d_departmentname, teaching_load.
    Purpose:
        Assists in faculty workload management by displaying faculty information, department names, and the count of courses taught.

3.4 Student Performance Tracking
View: student_performance

    Columns:
        student_id, s_firstname, s_surname, e_grade, c_coursename.
    Purpose:
        Allows tracking of student performance by showing student details, grades, and associated course names.

3.5 Security Measures
Stored Procedure: audit_access
Trigger: audit_access_trigger

    Purpose:
        Implements security measures (e.g., logging access, checking permissions) through a stored procedure.
        Trigger executes the stored procedure before inserts, updates, or deletes on relevant tables.

4. Data Insertion Example

sql

-- Insert into departments
INSERT INTO departments (d_departmentname, faculty_id) VALUES
    ('Computer Science', 1),
    -- Add more departments as needed...

-- Insert into faculties
INSERT INTO faculties (f_facultyname, department_id, f_contact, f_officehours) VALUES
    ('Engineering', 1, '1234567890', 'Monday-Friday, 9:00 AM - 5:00 PM'),
    -- Add more faculties as needed...

-- Insert into courses
INSERT INTO courses (c_coursename, department_id, c_credithours, c_prerequisites) VALUES
    ('Introduction to Programming', 1, 3, NULL),
    -- Add more courses as needed...

-- Insert into students
INSERT INTO students (s_firstname, s_surname, s_enrollmentdate, major_id, s_contact, s_email) VALUES
    ('Alice', 'Johnson', '2023-01-15', 1, '9876543210', 'alice@email.com'),
    -- Add more students as needed...

-- Insert into classroomassignment
INSERT INTO classroomassignment (ca_roomnumber, course_id, ca_timeslot, ca_maximumcapacity) VALUES
    ('101', 1, 'Monday 10:00 AM - 12:00 PM', 30),
    -- Add more classroom assignments as needed...

-- Insert into enrollments
INSERT INTO enrollments (student_id, course_id, e_enrollmentdate, e_grade) VALUES
    (1, 1, '2023-01-20', 'A'),
    -- Add more enrollments as needed...

5. Design Decisions and Challenges
5.1 Data Relationships

    Challenge:
        Managing relationships between departments, faculties, courses, students, and classroom assignments.
    Design Decision:
        Utilized foreign keys to establish relationships between entities and added constraints for data integrity.

5.2 Views for Different Modules

    Challenge:
        Providing specialized views for academic advising, classroom scheduling, faculty workload management, and student performance tracking.
    Design Decision:
        Created specific views (student_advising, classroomassignment_schedule, faculty_workload, student_performance) to address the unique requirements of each module.

5.3 Security Measures

    Challenge:
        Implementing security measures to track and control access.
    Design Decision:
        Introduced a stored procedure (audit_access) and trigger (audit_access_trigger) to implement security measures by logging access and checking permissions.