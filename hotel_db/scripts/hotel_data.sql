-- Insert into rooms
INSERT INTO rooms (r_roomtype, r_status, r_cleaningschedule, r_roomfeatures)
VALUES
    ('Single', 'Vacant', '2023-02-01 08:00:00', 'Wifi'),
    ('Double', 'Occupied', '2023-02-01 10:00:00', 'Fridge, Wifi, Tv'),
    ('Suite', 'Vacant', '2023-02-01 12:00:00', 'Balcony, Tv'),
    ('Single', 'Vacant', '2023-02-01 14:00:00', 'Wifi, Balcony'),
    ('Double', 'Vacant', '2023-02-01 16:00:00', 'Wifi, Fridge'),
    ('Suite', 'Occupied', '2023-02-01 18:00:00', 'Balcony, Fridge, Tv'),
    ('Single', 'Occupied', '2023-02-01 20:00:00', 'Wifi, Tv'),
    ('Double', 'Vacant', '2023-02-02 08:00:00', 'Fridge, Tv'),
    ('Suite', 'Vacant', '2023-02-02 10:00:00', 'Balcony, Wifi'),
    ('Single', 'Vacant', '2023-02-02 12:00:00', 'Wifi');

-- Insert into guests
INSERT INTO guests (g_firstname, g_surname, g_contact, g_email, booking_id, g_loyalprogrammembership)
VALUES
    ('Alice', 'Johnson', '1234567890', 'alice.johnson@email.com', 1, 'Yes'),
    ('Bob', 'Smith', '9876543210', 'bob.smith@email.com', 2, 'No'),
    ('Charlie', 'Williams', '2345678901', 'charlie.williams@email.com', 3, 'Yes'),
    ('David', 'Davis', '3456789012', 'david.davis@email.com', 4, 'No'),
    ('Eva', 'Miller', '4567890123', 'eva.miller@email.com', 5, 'Yes'),
    ('Frank', 'Brown', '5678901234', 'frank.brown@email.com', 6, 'No'),
    ('Grace', 'Clark', '6789012345', 'grace.clark@email.com', 7, 'Yes'),
    ('Henry', 'Anderson', '7890123456', 'henry.anderson@email.com', 8, 'No'),
    ('Isabel', 'Taylor', '8901234567', 'isabel.taylor@email.com', 9, 'Yes'),
    ('John', 'Moore', '9012345678', 'john.moore@email.com', 10, 'No');

-- Insert into bookings
INSERT INTO bookings (guest_id, room_id, b_checkin, b_checkout, b_paymentstatus)
VALUES
    (1, 1, '2023-02-01', '2023-02-05', 'Paid'),
    (2, 2, '2023-02-03', '2023-02-08', 'Not Paid'),
    (3, 3, '2023-02-05', '2023-02-10', 'Paid'),
    (4, 4, '2023-02-07', '2023-02-12', 'Not Paid'),
    (5, 5, '2023-02-09', '2023-02-14', 'Paid'),
    (6, 6, '2023-02-11', '2023-02-16', 'Not Paid'),
    (7, 7, '2023-02-13', '2023-02-18', 'Paid'),
    (8, 8, '2023-02-15', '2023-02-20', 'Not Paid'),
    (9, 9, '2023-02-17', '2023-02-22', 'Paid'),
    (10, 10, '2023-02-19', '2023-02-24', 'Not Paid');

-- Insert into servicerequests
INSERT INTO servicerequests (booking_id, sr_description, employee_id, sr_fufillmentstatus)
VALUES
    (1, 'Additional pillows needed', 1, 'Pending'),
    (2, 'TV remote not working', 2, 'Completed'),
    (3, 'Room cleaning required', 3, 'Pending'),
    (4, 'Toilet is clogged', 1, 'Completed'),
    (5, 'Request for extra towels', 2, 'Pending'),
    (6, 'Assistance with luggage', 3, 'Completed'),
    (7, 'Room temperature too low', 1, 'Pending'),
    (8, 'Internet connection issue', 2, 'Completed'),
    (9, 'Need assistance with checkout', 3, 'Pending'),
    (10, 'Replace lightbulbs', 1, 'Completed');

-- Insert into employees
INSERT INTO employees (e_firstname, e_surname, e_role, e_contact, assignedtask_id)
VALUES
    ('Rebecca', 'Jones', 'Receptionist', '1234567890', 1),
    ('Michael', 'Smith', 'Housekeeping', '9876543210', 2),
    ('Emily', 'Brown', 'Manager', '2345678901', 3),
    ('David', 'Taylor', 'Receptionist', '3456789012', 4),
    ('Amanda', 'Wilson', 'Housekeeping', '4567890123', 5),
    ('Christopher', 'Davis', 'Manager', '5678901234', 6),
    ('Olivia', 'Moore', 'Receptionist', '6789012345', 7),
    ('Ethan', 'Anderson', 'Housekeeping', '7890123456', 8),
    ('Sophia', 'Clark', 'Manager', '8901234567', 9),
    ('George', 'White', 'Receptionist', '9012345678', 10);

-- Insert into rates
INSERT INTO rates (r_roomtype, r_ratepernight, r_seasonaladjustments)
VALUES
    ('Single', 100.00, 0.05),
    ('Double', 150.00, 0.10),
    ('Suite', 250.00, 0.15);