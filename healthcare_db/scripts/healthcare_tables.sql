CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    p_firstname VARCHAR(50),
    p_surname VARCHAR(50),
    p_birthdate DATE CHECK (p_birthdate<= CURRENT_DATE),
    p_contact VARCHAR(20),
    p_email VARCHAR(320),
    p_medicalhistory TEXT,
    p_currenttreatments TEXT
);


CREATE TABLE inventory (
    item_id SERIAL PRIMARY KEY,
    i_inventoryname VARCHAR(50),
    i_quantity INT CHECK (i_quantity >= 0),
    i_reorderlevel INT CHECK (i_reorderlevel > 0)
);


CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    s_firstname VARCHAR(50),
    s_surname VARCHAR(50),
    s_speciality TEXT,
    s_contact VARCHAR(20),
    s_workinghours TEXT
);


CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES staff(staff_id),
    a_appointmentdate DATE CHECK (a_appointmentdate > CURRENT_DATE),
    a_appointmenttime TIMESTAMPTZ CHECK (a_appointmenttime > CURRENT_TIMESTAMP),
    a_visitpurpose TEXT
);


CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    d_departmentname VARCHAR(50),
    departmenthead_id INT REFERENCES staff(staff_id)
);


CREATE TABLE doctorpatientrelationship (
    doctor_id INT REFERENCES staff(staff_id),
    patient_id INT REFERENCES patients(patient_id),
    CONSTRAINT doctorpatient_id PRIMARY KEY (doctor_id,patient_id)
);


-- ADDITIONAL FEATURES

-- Trigger to check for overlapping appointments
CREATE OR REPLACE FUNCTION check_overlapping_appointments() RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM appointments
        WHERE doctor_id = NEW.doctor_id
          AND a_appointmentdate = NEW.a_appointmentdate
          AND (
              (a_appointmenttime >= NEW.a_appointmenttime AND a_appointmenttime < NEW.a_appointmenttime + INTERVAL '1 hour')
              OR (a_appointmenttime + INTERVAL '1 hour' > NEW.a_appointmenttime AND a_appointmenttime < NEW.a_appointmenttime)
          )
    ) THEN
        RAISE EXCEPTION 'Overlapping appointments are not allowed';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_overlapping_appointments_trigger
BEFORE INSERT OR UPDATE ON appointments
FOR EACH ROW
EXECUTE FUNCTION check_overlapping_appointments();


-- Trigger to send inventory alerts
CREATE OR REPLACE FUNCTION check_inventory_levels() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.i_quantity <= NEW.i_reorderlevel THEN
        -- Trigger an alert mechanism (e.g., email notification, log entry, etc.)
        RAISE NOTICE 'Inventory item % is below reorder level', NEW.i_inventoryname;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_inventory_levels_trigger
BEFORE INSERT OR UPDATE ON inventory
FOR EACH ROW
EXECUTE FUNCTION check_inventory_levels();