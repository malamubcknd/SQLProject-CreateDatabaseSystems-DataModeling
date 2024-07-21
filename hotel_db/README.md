Database Documentation: Hotel Management System
1. Overview

The Hotel Management System database is designed to manage hotel-related information, including rooms, bookings, guests, service requests, employees, rates, and additional features such as online bookings, staff scheduling, guest information aggregation, dynamic room pricing, and enhanced data security measures.
2. Table Descriptions
2.1 Rooms Table
rooms

    Columns:
        room_id (Primary Key): Unique identifier for each room.
        r_roomtype: Type of the room (Single, Double, Suite).
        r_status: Current status of the room (Occupied, Vacant).
        r_cleaningschedule: Timestamp indicating the cleaning schedule for the room.
        r_roomfeatures: Features available in the room (Fridge, Wifi, Balcony, Tv).

2.2 Bookings Table
bookings

    Columns:
        booking_id (Primary Key): Unique identifier for each booking.
        guest_id: Foreign key referencing the guest for the booking.
        room_id: Foreign key referencing the room for the booking.
        b_checkin and b_checkout: Dates indicating the check-in and check-out dates.
        b_paymentstatus: Payment status of the booking (Paid, Not Paid).

2.3 Guests Table
guests

    Columns:
        guest_id (Primary Key): Unique identifier for each guest.
        g_firstname and g_surname: Guest's first and last name.
        g_contact and g_email: Contact information for the guest.
        booking_id: Foreign key referencing the booking associated with the guest.
        g_loyalprogrammembership: Indicates whether the guest is a member of the loyalty program (Yes, No).

2.4 Service Requests Table
servicerequests

    Columns:
        request_id (Primary Key): Unique identifier for each service request.
        booking_id: Foreign key referencing the booking associated with the service request.
        sr_description: Text field describing the service request.
        employee_id: Foreign key referencing the employee responsible for fulfilling the request.
        sr_fulfillmentstatus: Fulfillment status of the service request (Completed, Pending).

2.5 Employees Table
employees

    Columns:
        employee_id (Primary Key): Unique identifier for each employee.
        e_firstname and e_surname: Employee's first and last name.
        e_role: Role or position of the employee (Receptionist, Housekeeping, Manager).
        e_contact: Contact information for the employee.
        assignedtask_id: Foreign key referencing the service request associated with the employee.

2.6 Rates Table
rates

    Columns:
        r_roomtype: Room type (Single, Double, Suite).
        r_ratepernight: Decimal representing the rate per night.
        r_seasonaladjustments: Decimal representing seasonal rate adjustments.

2.7 Additional Features
2.7.1 Online Bookings

    Procedure:
        BookRoom(IN guest_id INT, IN room_id INT, IN checkin_date DATE, IN checkout_date DATE)
    View:
        OnlineBookings
    Purpose:
        Provides a stored procedure for handling online bookings.
        Creates a view to represent the current online booking status.

2.7.2 Staff Scheduling

    Procedure:
        ScheduleStaff(IN date_to_schedule DATE)
    View:
        StaffSchedules
    Purpose:
        Implements a stored procedure for automated staff scheduling based on hotel occupancy and workload.
        Creates a view to display staff schedules.

2.7.3 Guest Information Aggregation

    View:
        GuestInformation
    Purpose:
        Aggregates guest information, including name, contact, email, check-in and check-out dates, and loyalty program membership.

2.7.4 Dynamic Room Pricing

    Procedure:
        CalculateRoomRate(IN room_id INT)
    View:
        DynamicRoomPricing
    Purpose:
        Provides a stored procedure for calculating and adjusting room rates based on demand, season, and special events.
        Creates a view to offer simplified access to dynamic pricing information.

2.7.5 Secure Data Access

    Procedure:
        SecureDataAccess()
    View:
        SecureGuestInformation
    Purpose:
        Implements stored procedures for data access to enforce security measures consistently.
        Creates a view to provide simplified access to data with security measures.

3. Relationships

    Rooms - Bookings Relationship:
        Rooms are associated with bookings through the room_id foreign key in the bookings table.

    Guests - Bookings Relationship:
        Guests are associated with bookings through the guest_id foreign key in the bookings table.

    Employees - Service Requests Relationship:
        Employees are associated with service requests through the employee_id foreign key in the servicerequests table.

    Employees - Assigned Task Relationship:
        Employees are associated with assigned tasks (service requests) through the assignedtask_id foreign key in the employees table.

4. Data Insertion Example

sql

-- Insert into rooms
INSERT INTO rooms (r_roomtype, r_status, r_cleaningschedule, r_roomfeatures)
VALUES
    ('Single', 'Vacant', '2023-01-01 09:00:00', 'Wifi'),
    -- Insert additional room records here...

-- Insert into bookings
INSERT INTO bookings (guest_id, room_id, b_checkin, b_checkout, b_paymentstatus)
VALUES
    (1, 1, '2023-01-05', '2023-01-10', 'Paid'),
    -- Insert additional booking records here...

-- Insert into guests
INSERT INTO guests (g_firstname, g_surname, g_contact, g_email, booking_id, g_loyalprogrammembership)
VALUES
    ('John', 'Doe', '1234567890', 'john.doe@email.com', 1, 'Yes'),
    -- Insert additional guest records here...

-- Insert into servicerequests
INSERT INTO servicerequests (booking_id, sr_description, employee_id, sr_fulfillmentstatus)
VALUES
    (1, 'Extra Towels', 2, 'Pending'),
    -- Insert additional service request records here...

-- Insert into employees
INSERT INTO employees (e_firstname, e_surname, e_role, e_contact, assignedtask_id)
VALUES
    ('Alice', 'Smith', 'Receptionist', '9876543210', 1),
    -- Insert additional employee records here...

-- Insert into rates
INSERT INTO rates (r_roomtype, r_ratepernight, r_seasonaladjustments)
VALUES
    ('Single', 99.99, 5.00),
    -- Insert additional rate records here...

5. Design Decisions and Challenges
5.1 Room Status and Cleaning Schedule

    Challenge:
        Ensuring accurate room status and scheduling cleaning activities.
    Design Decision:
        Introduced the r_status column and r_cleaningschedule timestamp in the rooms table to manage room status and cleaning schedules effectively.

5.2 Employee Role and Task Assignment

    Challenge:
        Assigning tasks to employees based on their roles.
    Design Decision:
        Created the e_role column in the employees table to identify employee roles and the assignedtask_id foreign key to associate tasks (service requests) with employees.

5.3 Security Measures for Data Access

    Challenge:
        Enforcing consistent security measures for data access.
    Design Decision:
        Implemented stored procedures (SecureDataAccess()) to control data access, ensuring that data is accessed only through these procedures.

5.4 Dynamic Room Pricing

    Challenge:
        Implementing a dynamic pricing mechanism based on various factors.
    Design Decision:
        Created a stored procedure (CalculateRoomRate()) to calculate and adjust room rates dynamically based on demand, season, and special events.

5.5 Online Bookings and Staff Scheduling

    Challenge:
        Implementing features for online bookings and staff scheduling.
    Design Decision:
        Introduced stored procedures (BookRoom() and ScheduleStaff()) to facilitate online bookings and automate staff scheduling.

5.6 Aggregation of Guest Information

    Challenge:
        Aggregating guest information for better insights.
    Design Decision:
        Created a view (GuestInformation) to aggregate guest details, including check-in and check-out dates and loyalty program membership.

5.7 Real-time Monitoring of Online Bookings

    Challenge:
        Monitoring and managing online bookings in real-time.
    Design Decision:
        Developed a view (OnlineBookings) to provide real-time information about online bookings.

5.8 Overlapping Appointments

    Challenge:
        Preventing overlapping appointments in the appointments scheduling system.
    Design Decision:
        Implemented a trigger (check_overlapping_appointments_trigger) and a function (check_overlapping_appointments()) to check for overlapping appointments in the healthcare management system.

5.9 Inventory Level Alerts

    Challenge:
        Notifying about low inventory levels.
    Design Decision:
        Implemented a trigger (check_inventory_levels_trigger) and a function (check_inventory_levels()) to raise a notice for low inventory in the library management system.

5.10 Additional Tables and Relationships

    Challenge:
        Introducing additional tables to track customer behavior, preferences, and feedback.
    Design Decision:
        Created tables such as customerfeedback, events, bookgenrerelationships, and memberloanrelationships to enhance the library management system with features like customer feedback tracking, event calendars, book-genre relationships, and member-loan relationships.