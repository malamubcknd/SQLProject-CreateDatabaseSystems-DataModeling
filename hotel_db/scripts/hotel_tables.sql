CREATE TABLE rooms(
    room_id SERIAL PRIMARY KEY,
    r_roomtype VARCHAR(10) CHECK (r_roomtype IN ('Single', 'Double','Suite')),
    r_status VARCHAR(10) CHECK (r_roomtype IN ('Occupied', 'Vacant')),
    r_cleaningschedule TIMESTAMP NOT NULL,
    r_roomfeatures VARCHAR(10) CHECK (r_roomfeatures IN ('Fridge','Wifi', 'Balcony','Tv'))
);


CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    guest_id INT,
    room_id INT REFERENCES rooms(room_id),
    b_checkin DATE NOT NULL,
    b_checkout DATE NOT NULL,
    b_paymentstatus VARCHAR(10) CHECK (b_paymentstatus IN ('Paid', 'Not Paid'))
);


CREATE TABLE guests(
    guest_id SERIAL PRIMARY KEY,
    g_firstname VARCHAR(50),
    g_surname VARCHAR(50),
    g_contact VARCHAR(20),
    g_email VARCHAR(320),
    booking_id INT REFERENCES bookings(booking_id),
    g_loyalprogrammembership VARCHAR(5) CHECK (g_loyalprogrammembership IN ('Yes', 'No'))
);


-- Add the guest_id foreign key constraint later because of dependencies between bookings and guests tables
ALTER TABLE bookings
ADD CONSTRAINT added_fk_guest_id
FOREIGN KEY (guest_id)
REFERENCES guests(guest_id);


CREATE TABLE servicerequests(
    request_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id),
    sr_description TEXT NOT NULL,
    employee_id INT,
    sr_fufillmentstatus VARCHAR(20) CHECK (sr_fufillmentstatus IN ('Completed', 'Pending'))
);


CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    e_firstname VARCHAR(50) NOT NULL,
    e_surname VARCHAR(50) NOT NULL,
    e_role VARCHAR(20) CHECK (e_role IN ('Receptionist', 'Housekeeping', 'Manager')),
    e_contact VARCHAR(20) NOT NULL,
    assignedtask_id INT REFERENCES servicerequests(request_id)
);


-- Add the employee_id foreign key constraint later because of dependencies between servicerequests and employees tables
ALTER TABLE servicerequests
ADD CONSTRAINT added_fk_employee_id
FOREIGN KEY (employee_id)
REFERENCES employees(employee_id);


CREATE TABLE rates(
    r_roomtype VARCHAR(10) CHECK (r_roomtype IN ('Single', 'Double','Suite')),
    r_ratepernight DECIMAL(10, 2) NOT NULL,
    r_seasonaladjustments DECIMAL(5, 2)
);



-- ADDITIONAL FEATURES 

-- Use a stored procedure to handle online booking and a view to represent the current online booking status
CREATE PROCEDURE BookRoom(IN guest_id INT, IN room_id INT, IN checkin_date DATE, IN checkout_date DATE)
BEGIN
    INSERT INTO bookings (guest_id, room_id, b_checkin, b_checkout, b_onlinebooking)
    VALUES (guest_id, room_id, checkin_date, checkout_date, TRUE);
END;

CREATE VIEW OnlineBookings AS
SELECT booking_id, guest_id, room_id, b_checkin, b_checkout
FROM bookings
WHERE b_onlinebooking = TRUE;


-- Implement a stored procedure for automated staff scheduling and a view for staff schedules.
CREATE PROCEDURE ScheduleStaff(IN date_to_schedule DATE)
BEGIN
    -- Your logic for automated staff scheduling based on hotel occupancy and workload.
    -- Insert/update records in staffschedule table.
END;

CREATE VIEW StaffSchedules AS
SELECT schedule_id, employee_id, schedule_date, shift_start, shift_end
FROM staffschedule;


-- Create views to aggregate guest information, preferences, feedback, and loyalty program details.
CREATE VIEW GuestInformation AS
SELECT g.guest_id, g.g_firstname, g.g_surname, g.g_contact, g.g_email,
       b.booking_id, b.b_checkin, b.b_checkout,
       g.g_loyalprogrammembership
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id;


-- Implement stored procedures to calculate and adjust room rates based on demand, season, and special events
CREATE PROCEDURE CalculateRoomRate(IN room_id INT)
BEGIN
    -- Your logic for calculating room rate based on demand, season, and special events.
    -- Update the rates table or return the calculated rate.
END;

-- Example of a view to provide simplified access to dynamic pricing information.
CREATE VIEW DynamicRoomPricing AS
SELECT room_id, r_roomtype, CalculateRoomRate(room_id) AS current_rate
FROM rooms;


-- Implement stored procedures for data access to enforce security measures consistently.
CREATE PROCEDURE SecureDataAccess()
BEGIN
    -- Your logic to enforce security measures for data access.
    -- Only allow data access through stored procedures.
END;

-- Example of a view to provide simplified access to data with security measures.
CREATE VIEW SecureGuestInformation AS
CALL SecureDataAccess();