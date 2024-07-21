Database Documentation: Healthcare Management System
1. Overview

The Healthcare Management System database is designed to manage information related to patients, medical staff, appointments, and inventory. The system aims to facilitate seamless coordination between patients, medical practitioners, and inventory management. Additionally, the system includes features such as preventing overlapping appointments and sending alerts for low inventory levels.
2. Table Descriptions
2.1 Patients Table
patients

    Columns:
        patient_id (Primary Key): Unique identifier for each patient.
        p_firstname and p_surname: Patient's first and last name.
        p_birthdate: Patient's date of birth.
        p_contact: Patient's contact number.
        p_email: Patient's email address.
        p_medicalhistory: Text field for recording the patient's medical history.
        p_currenttreatments: Text field for recording the patient's current treatments.

2.2 Inventory Table
inventory

    Columns:
        item_id (Primary Key): Unique identifier for each inventory item.
        i_inventoryname: Name of the inventory item.
        i_quantity: Quantity of the inventory item.
        i_reorderlevel: Reorder level for the inventory item.

2.3 Staff Table
staff

    Columns:
        staff_id (Primary Key): Unique identifier for each staff member.
        s_firstname and s_surname: Staff member's first and last name.
        s_speciality: Specialization or role of the staff member.
        s_contact: Contact number for the staff member.
        s_workinghours: Text field for recording the staff member's working hours.

2.4 Appointments Table
appointments

    Columns:
        appointment_id (Primary Key): Unique identifier for each appointment.
        patient_id: Foreign key referencing the patient for the appointment.
        doctor_id: Foreign key referencing the staff member (doctor) for the appointment.
        a_appointmentdate: Date of the appointment.
        a_appointmenttime: Timestamp with time zone for the appointment time.
        a_visitpurpose: Text field for specifying the purpose of the visit.

2.5 Department Table
department

    Columns:
        department_id (Primary Key): Unique identifier for each department.
        d_departmentname: Name of the department.
        departmenthead_id: Foreign key referencing the staff member who is the head of the department.

2.6 Doctor-Patient Relationship Table
doctorpatientrelationship

    Columns:
        doctor_id and patient_id (Composite Primary Key): Composite primary key representing the relationship between doctors and patients.

2.7 Additional Features
2.7.1 Trigger for Overlapping Appointments

    Function:
        check_overlapping_appointments()
    Trigger:
        check_overlapping_appointments_trigger
    Purpose:
        Checks for overlapping appointments for the same doctor on the same date and time.
        Raises an exception if overlapping appointments are detected.

2.7.2 Trigger for Inventory Level Alerts

    Function:
        check_inventory_levels()
    Trigger:
        check_inventory_levels_trigger
    Purpose:
        Checks inventory levels before insert or update operations.
        Raises a notice if the inventory quantity is below the reorder level.

3. Relationships

    Patients - Appointments Relationship:
        Patients are associated with appointments through the patient_id foreign key in the appointments table.

    Staff - Appointments Relationship:
        Medical staff (doctors) are associated with appointments through the doctor_id foreign key in the appointments table.

    Staff - Department Relationship:
        Staff members are associated with departments through the departmenthead_id foreign key in the department table.

    Doctor-Patient Relationship:
        Represents a many-to-many relationship between doctors and patients, ensuring each patient can have multiple doctors and vice versa.

4. Data Insertion Example

sql

-- Insert into patients
INSERT INTO patients (p_firstname, p_surname, p_birthdate, p_contact, p_email, p_medicalhistory, p_currenttreatments)
VALUES
    ('John', 'Doe', '1990-01-15', '1234567890', 'john.doe@email.com', 'Medical history details', 'Current treatments details'),
    -- Insert additional patient records here...

-- Insert into inventory
INSERT INTO inventory (i_inventoryname, i_quantity, i_reorderlevel)
VALUES
    ('Medication A', 50, 20),
    -- Insert additional inventory records here...

-- Insert into staff
INSERT INTO staff (s_firstname, s_surname, s_speciality, s_contact, s_workinghours)
VALUES
    ('Dr. Smith', 'Johnson', 'Cardiologist', '9876543210', '9:00 AM - 5:00 PM'),
    -- Insert additional staff records here...

-- Insert into appointments
INSERT INTO appointments (patient_id, doctor_id, a_appointmentdate, a_appointmenttime, a_visitpurpose)
VALUES
    (1, 1, '2023-01-20', '2023-01-20 10:00:00+00', 'Regular checkup'),
    -- Insert additional appointment records here...

-- Insert into department
INSERT INTO department (d_departmentname, departmenthead_id)
VALUES
    ('Cardiology', 1),
    -- Insert additional department records here...

-- Insert into doctorpatientrelationship
INSERT INTO doctorpatientrelationship (doctor_id, patient_id)
VALUES
    (1, 1),
    -- Insert additional doctor-patient relationship records here...

5. Design Decisions and Challenges
5.1 Overlapping Appointments

    Challenge:
        Preventing overlapping appointments for the same doctor.
    Design Decision:
        Implemented a trigger (check_overlapping_appointments_trigger) and a function (check_overlapping_appointments()) to check for overlapping appointments.

5.2 Inventory Level Alerts

    Challenge:
        Notifying about low inventory levels.
    Design Decision:
        Implemented a trigger (check_inventory_levels_trigger) and a function (check_inventory_levels()) to raise a notice for low inventory.