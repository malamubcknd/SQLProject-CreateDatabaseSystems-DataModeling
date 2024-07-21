-- Insert into patients
INSERT INTO patients (p_firstname, p_surname, p_birthdate, p_contact, p_email, p_medicalhistory, p_currenttreatments)
VALUES
    ('John', 'Doe', '1990-01-01', '1234567890', 'john.doe@email.com', 'High blood pressure', 'None'),
    ('Jane', 'Smith', '1985-05-15', '9876543210', 'jane.smith@email.com', 'Diabetes', 'Insulin therapy'),
    ('Bob', 'Johnson', '1978-09-22', '2345678901', 'bob.johnson@email.com', 'Allergies', 'Antihistamine'),
    ('Alice', 'Williams', '1982-03-05', '3456789012', 'alice.williams@email.com', 'Asthma', 'Inhaler'),
    ('Charlie', 'Davis', '1995-07-10', '4567890123', 'charlie.davis@email.com', 'None', 'None'),
    ('Eva', 'Martin', '1988-11-18', '5678901234', 'eva.martin@email.com', 'Arthritis', 'Pain medication'),
    ('David', 'Taylor', '1980-04-25', '6789012345', 'david.taylor@email.com', 'Heart condition', 'Beta blockers'),
    ('Grace', 'Anderson', '1973-08-30', '7890123456', 'grace.anderson@email.com', 'Depression', 'Antidepressants'),
    ('Henry', 'Miller', '1992-02-12', '8901234567', 'henry.miller@email.com', 'Migraines', 'Migraine medication'),
    ('Isabel', 'Clark', '1987-06-21', '9012345678', 'isabel.clark@email.com', 'Hypothyroidism', 'Thyroid medication');

-- Insert into inventory
INSERT INTO inventory (i_inventoryname, i_quantity, i_reorderlevel)
VALUES
    ('Medical Gloves', 500, 100),
    ('Bandages', 1000, 200),
    ('Painkillers', 300, 50),
    ('Antibiotics', 200, 30),
    ('Blood Pressure Monitor', 20, 5),
    ('Thermometers', 50, 10),
    ('Syringes', 200, 40),
    ('Wound Dressings', 800, 150),
    ('Cough Syrup', 150, 25),
    ('First Aid Kits', 30, 5);

-- Insert into staff
INSERT INTO staff (s_firstname, s_surname, s_speciality, s_contact, s_workinghours)
VALUES
    ('Dr. Sarah', 'Jones', 'Cardiologist', '1234567890', 'Monday to Friday, 9 AM - 5 PM'),
    ('Dr. Michael', 'Smith', 'Pediatrician', '9876543210', 'Tuesday to Saturday, 10 AM - 6 PM'),
    ('Dr. Emily', 'Brown', 'Dermatologist', '2345678901', 'Monday to Thursday, 8 AM - 4 PM'),
    ('Dr. Robert', 'Taylor', 'Orthopedic Surgeon', '3456789012', 'Wednesday to Sunday, 11 AM - 7 PM'),
    ('Dr. Amanda', 'Wilson', 'Psychiatrist', '4567890123', 'Thursday to Monday, 12 PM - 8 PM'),
    ('Nurse Jessica', 'Miller', 'General Nurse', '5678901234', 'Monday to Friday, 7 AM - 3 PM'),
    ('Dr. Christopher', 'Davis', 'Neurologist', '6789012345', 'Tuesday to Saturday, 9 AM - 5 PM'),
    ('Dr. Olivia', 'Moore', 'Ophthalmologist', '7890123456', 'Monday to Thursday, 10 AM - 6 PM'),
    ('Dr. Ethan', 'Anderson', 'Gastroenterologist', '8901234567', 'Friday to Sunday, 1 PM - 9 PM'),
    ('Dr. Sophia', 'Clark', 'Rheumatologist', '9012345678', 'Tuesday to Sunday, 11 AM - 7 PM');

-- Insert into appointments
INSERT INTO appointments (patient_id, doctor_id, a_appointmentdate, a_appointmenttime, a_visitpurpose)
VALUES
    (1, 1, '2023-02-01', '2023-02-01 10:00:00', 'Cardiac checkup'),
    (2, 2, '2023-02-10', '2023-02-10 11:30:00', 'Pediatric consultation'),
    (3, 3, '2023-02-15', '2023-02-15 08:45:00', 'Dermatology appointment'),
    (4, 4, '2023-02-22', '2023-02-22 14:15:00', 'Orthopedic consultation'),
    (5, 5, '2023-03-05', '2023-03-05 12:30:00', 'Psychiatric evaluation'),
    (6, 6, '2023-03-10', '2023-03-10 09:15:00', 'Nurse appointment'),
    (7, 7, '2023-03-18', '2023-03-18 16:45:00', 'Neurology consultation'),
    (8, 8, '2023-03-25', '2023-03-18 16:45:00', 'Neurology consultation');



-- Insert into department
INSERT INTO department (d_departmentname, departmenthead_id)
VALUES
    ('Cardiology', 1),
    ('Pediatrics', 2),
    ('Dermatology', 3),
    ('Orthopedics', 4),
    ('Psychiatry', 5),
    ('Nursing', 6),
    ('Neurology', 7),
    ('Ophthalmology', 8),
    ('Gastroenterology', 9),
    ('Rheumatology', 10);

-- Insert into doctorpatientrelationship
INSERT INTO doctorpatientrelationship (doctor_id, patient_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);