-- Insert into departments
INSERT INTO departments (d_departmentname, faculty_id)
VALUES
    ('Computer Science', 1),
    ('Mechanical Engineering', 2),
    ('Physics', 3),
    ('Psychology', 4),
    ('Economics', 5),
    ('Biology', 6),
    ('English Literature', 7),
    ('History', 8),
    ('Mathematics', 9),
    ('Chemistry', 10);

-- Insert into faculties
INSERT INTO faculties (f_facultyname, department_id, f_contact, f_officehours)
VALUES
    ('Faculty of Computer Science', 1, '1234567890', 'Mon-Fri, 9 AM - 5 PM'),
    ('Faculty of Mechanical Engineering', 2, '9876543210', 'Mon-Fri, 8 AM - 4 PM'),
    ('Faculty of Physics', 3, '2345678901', 'Tue-Sat, 10 AM - 6 PM'),
    ('Faculty of Psychology', 4, '3456789012', 'Mon-Thu, 11 AM - 7 PM'),
    ('Faculty of Economics', 5, '4567890123', 'Wed-Sun, 12 PM - 8 PM'),
    ('Faculty of Biology', 6, '5678901234', 'Mon-Fri, 7 AM - 3 PM'),
    ('Faculty of English Literature', 7, '6789012345', 'Tue-Sat, 9 AM - 5 PM'),
    ('Faculty of History', 8, '7890123456', 'Mon-Thu, 10 AM - 6 PM'),
    ('Faculty of Mathematics', 9, '8901234567', 'Fri-Sun, 1 PM - 9 PM'),
    ('Faculty of Chemistry', 10, '9012345678', 'Tue-Sun, 11 AM - 7 PM');

-- Insert into courses
INSERT INTO courses (c_coursename, department_id, c_credithours, c_prerequisites)
VALUES
    ('Introduction to Programming', 1, 3, NULL),
    ('Mechanics and Dynamics', 2, 4, 'Physics 101'),
    ('Modern Physics', 3, 3, 'Physics 101'),
    ('Introduction to Psychology', 4, 3, NULL),
    ('Microeconomics', 5, 3, NULL),
    ('Cell Biology', 6, 4, 'Biology 101'),
    ('British Literature', 7, 3, NULL),
    ('World History', 8, 3, NULL),
    ('Calculus I', 9, 4, 'Mathematics 101'),
    ('Organic Chemistry', 10, 4, 'Chemistry 101');

-- Insert into students
INSERT INTO students (s_firstname, s_surname, s_enrollmentdate, major_id, s_contact, s_email)
VALUES
    ('John', 'Doe', '2023-01-15', 1, '1234567890', 'john.doe@email.com'),
    ('Jane', 'Smith', '2023-02-01', 2, '9876543210', 'jane.smith@email.com'),
    ('Bob', 'Johnson', '2023-02-15', 3, '2345678901', 'bob.johnson@email.com'),
    ('Alice', 'Williams', '2023-03-01', 4, '3456789012', 'alice.williams@email.com'),
    ('Charlie', 'Davis', '2023-03-15', 5, '4567890123', 'charlie.davis@email.com'),
    ('Eva', 'Martin', '2023-04-01', 6, '5678901234', 'eva.martin@email.com'),
    ('David', 'Taylor', '2023-04-15', 7, '6789012345', 'david.taylor@email.com'),
    ('Grace', 'Anderson', '2023-05-01', 8, '7890123456', 'grace.anderson@email.com'),
    ('Henry', 'Miller', '2023-05-15', 9, '8901234567', 'henry.miller@email.com'),
    ('Isabel', 'Clark', '2023-06-01', 10, '9012345678', 'isabel.clark@email.com');

-- Insert into classroomassignment
INSERT INTO classroomassignment (ca_roomnumber, course_id, ca_timeslot, ca_maximumcapacity)
VALUES
    ('101', 1, 'Mon-Wed 10:00 AM - 11:30 AM', 30),
    ('201', 2, 'Tue-Thu 02:00 PM - 03:30 PM', 40),
    ('301', 3, 'Mon-Wed 01:00 PM - 02:30 PM', 35),
    ('102', 4, 'Tue-Thu 11:00 AM - 12:30 PM', 25),
    ('202', 5, 'Mon-Wed 03:00 PM - 04:30 PM', 50),
    ('302', 6, 'Tue-Thu 09:00 AM - 10:30 AM', 45),
    ('103', 7, 'Mon-Wed 11:00 AM - 12:30 PM', 30),
    ('203', 8, 'Tue-Thu 03:00 PM - 04:30 PM', 40),
    ('303', 9, 'Mon-Wed 02:00 PM - 03:30 PM', 35),
    ('104', 10, 'Tue-Thu 01:00 PM - 02:30 PM', 25);

-- Insert into enrollments
INSERT INTO enrollments (student_id, course_id, e_enrollmentdate, e_grade)
VALUES
    (1, 1, '2023-01-20', 'A-'),
    (2, 2, '2023-02-05', 'B+'),
    (3, 3, '2023-02-20', 'A'),
    (4, 4, '2023-03-07', 'B-'),
    (5, 5, '2023-03-22', 'A+'),
    (6, 6, '2023-04-07', 'C+'),
    (7, 7, '2023-04-22', 'A-'),
    (8, 8, '2023-05-07', 'B+'),
    (9, 9, '2023-05-22', 'A'),
    (10, 10, '2023-06-07', 'B-');