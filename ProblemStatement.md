Use Case 1: Healthcare Management System
Scenario: A hospital needs a database system to manage patient records, appointments, medical staff, and inventory of medical supplies.

Requirements:
Patient information including name, date of birth, contact details, medical history, and current treatments.
Appointments table with patient ID, doctor ID, appointment date and time, and purpose.
Staff table including doctor and nurse details like staff ID, name, specialty, contact, and working hours.
Inventory management for medical supplies with details like item ID, name, quantity, and reorder level.
Relationship between doctors and patients to track which doctor is treating which patient.

Business Rules:
Each patient can have multiple appointments but each appointment is with one doctor.
Staff can be assigned to multiple departments but have one primary department.
Inventory items should be linked to the department where they are most used.

Requirements

Patient Information:
Patient ID (unique identifier)
Name
Date of Birth
Contact Details (phone, email)
Medical History (text field)
Current Treatments (text field)

Appointments Table:
Appointment ID (unique identifier)
Patient ID (foreign key)
Doctor ID (foreign key)
Appointment Date and Time
Purpose of Visit (text field)

Staff Table:
Staff ID (unique identifier)
Name
Specialty (text field)
Contact Information
Working Hours (text field)

Inventory Management for Medical Supplies:
Item ID (unique identifier)
Name
Quantity Available
Reorder Level

Department Table:
Department ID (unique identifier)
Department Name
Department Head (Staff ID)


Doctor-Patient Relationship Table:
Relationship ID (unique identifier)
Doctor ID (foreign key)
Patient ID (foreign key)

Business Rules and Constraints

Patient Constraints:
Each patient has a unique Patient ID.
Date of Birth must be a past date.
Contact details must include at least one method of contact (phone or email).

Appointments Constraints:
Each appointment is uniquely identified by an Appointment ID.
Each appointment must have a valid Patient ID and Doctor ID.
Appointment Date and Time must be a future date and time.

Staff and Department Constraints:
Each staff member has a unique Staff ID.
Staff members can be assigned to multiple departments, but there must be one primary department.
Each department has at least one staff member assigned.

Inventory Management Constraints:
Each medical supply item has a unique Item ID.
Quantity Available must be a non-negative number.
Reorder Level must be a positive number and less than the maximum storage capacity.

Doctor-Patient Relationship Constraints:
A patient can have multiple doctors, and a doctor can treat multiple patients.
Each relationship entry is uniquely identified by a Relationship ID.

General Constraints:
All IDs (Patient ID, Appointment ID, Staff ID, Item ID, Department ID, Relationship ID) must be unique and non-null.
Text fields like Medical History, Purpose of Visit, Specialty, and Working Hours should allow sufficient text length.

Additional Features
Appointment Scheduling System:
To handle conflicts in scheduling and ensure no overlapping appointments for the same doctor.

Inventory Alerts:
Automatic alerts when inventory items reach reorder levels.

Staff Scheduling and Department Management:
Module to manage staff schedules, department assignments, and departmental responsibilities.

Security and Privacy:
Implement strong security measures to protect sensitive patient data in compliance with healthcare regulations like HIPAA.

Reporting and Analytics:
Advanced reporting features for patient trends, staff performance, and inventory usage.







Use Case 2: University Enrollment and Course Management
Scenario: A university needs a database to manage student enrollments, course offerings, faculty information, and classroom assignments.

Requirements:
Student table with details like student ID, name, enrollment date, major.
Course table listing course ID, name, department, and credit hours.
Faculty table with faculty ID, name, department, and courses taught.
Classroom assignment details for each course, including room number and time slots.
Relationships between students and courses for enrollment tracking.

Business Rules:
Each course can have multiple students enrolled.
Faculty can teach multiple courses, but each course is taught by only one faculty member.
Classrooms have a maximum capacity that must not be exceeded by course enrollment.

Requirements

Student Table:
Student ID (unique identifier)
Name
Enrollment Date
Major (linked to a Majors table)
Contact Information (email, phone)

Course Table:
Course ID (unique identifier)
Name
Department ID (foreign key)
Credit Hours
Prerequisites (optional, linked to other courses)

Faculty Table:
Faculty ID (unique identifier)
Name
Department ID (foreign key)
Contact Information
Office Hours

Classroom Assignment Table:
Room Number
Course ID (foreign key)
Time Slot
Maximum Capacity

Enrollment Table:
Enrollment ID (unique identifier)
Student ID (foreign key)
Course ID (foreign key)
Enrollment Date
Grade (optional)

Department Table:
Department ID (unique identifier)
Department Name
Head of Department (Faculty ID)

Business Rules and Constraints

Student Constraints:
Each student must have a unique Student ID.
Enrollment Date must be a valid date within the academic calendar.
Students must be enrolled in a valid major offered by the university.

Course Constraints:
Each course must have a unique Course ID.
Courses belong to one department but can have cross-listings.
Credit Hours must be a positive integer.

Faculty Constraints:
Each faculty member has a unique Faculty ID.
A faculty member belongs to one department but may teach courses in multiple departments.

Classroom Assignment Constraints:
Each course can have multiple time slots but must be assigned to a classroom with sufficient capacity.
No overlapping class times for the same room.
Enrollment Constraints:

Students can enroll in multiple courses.
Each course can have multiple students, respecting classroom capacity.
Department Constraints:

Each department has a unique Department ID.
Departments have at least one faculty member.


Additional Features
Academic Advising Module:

To assist students in course selection and major declaration, ensuring compliance with academic requirements.
Classroom Scheduling System:

Automated system for allocating classrooms to avoid conflicts and optimize space usage.
Faculty Workload Management:

System to track and manage faculty teaching loads, research commitments, and administrative duties.
Student Performance Tracking:

Tools to monitor and report on student grades, progress towards degree, and academic standing.
Security Measures:

Strong data protection and privacy measures to safeguard student and faculty information.







Use Case 3: E-commerce Retail Platform
Scenario: An online retail company requires a database to manage products, customers, orders, and shipping logistics.


Requirements:
Product catalog with product ID, name, category, price, and stock level.
Customer profiles including customer ID, name, address, and order history.
Order details such as order ID, customer ID, product ID, quantity, and order date.
Shipping information including order ID, shipping method, tracking number, and delivery status.
Relationship between products and categories, and orders and customers.


Business Rules:
Customers can place multiple orders, but each order is linked to one customer.
Products can be in multiple categories, and each order can include multiple products.
Shipping information is mandatory for each order.

Requirements

Product Catalog:
Product ID (unique identifier)
Name
Category ID (foreign key to a Categories table)
Price
Stock Level
Description (optional)

Customer Profiles:
Customer ID (unique identifier)
Name
Address (including street, city, postal code, country)
Email
Phone Number
Registration Date

Order Details:
Order ID (unique identifier)
Customer ID (foreign key)
Order Date
Total Amount
Order Status (e.g., Pending, Shipped, Delivered)

Order Items Table:
Order Item ID (unique identifier)
Order ID (foreign key)
Product ID (foreign key)
Quantity
Price per Unit

Shipping Information:
Shipping ID (unique identifier)
Order ID (foreign key)
Shipping Method
Tracking Number
Delivery Status
Estimated Delivery Date

Product Categories Table:
Category ID (unique identifier)
Category Name
Parent Category ID (for hierarchical categorization)

Business Rules and Constraints
Product Constraints:

Each product is uniquely identified by a Product ID.
Stock Level must be a non-negative integer.
Products can belong to multiple categories.
Customer Constraints:

Each customer is uniquely identified by a Customer ID.
Email and phone number must be validated for format.
Registration Date must be a past or current date.
Order Constraints:

Each order is uniquely identified by an Order ID.
An order must contain at least one product.
Total Amount is calculated based on the order items and their quantities.
Shipping Constraints:

Each shipping entry is uniquely identified by a Shipping ID.
Tracking Number must be unique.
Delivery Status must be one of the predefined statuses.
Category Constraints:

Each category has a unique Category ID.
Parent Category ID is used for subcategories.

Additional Features
Inventory Management System:

Automatic updates of stock levels after each order.
Alerts for low stock levels.
Customer Relationship Management (CRM):

Tools for tracking customer behavior, preferences, and feedback.
Integrated marketing tools for personalized promotions and communication.
Order Tracking and Management:

Real-time tracking of orders for customers.
Efficient order processing and status updates for internal use.
Analytics and Reporting:

Comprehensive analytics on sales trends, customer demographics, and product performance.
Regular reporting for strategic decision-making.
Security and Data Protection:

Strong encryption and security protocols for customer data protection.
Compliance with data privacy laws and regulations.






Use Case 4: Hotel Reservation System
Scenario: A hotel chain needs a database to manage room bookings, guest information, staff assignments, and service requests.

Requirements:
Guest profiles with details like guest ID, name, contact information, and booking history.
Room details including room ID, type, status (occupied/vacant), and cleaning schedule.
Staff information such as employee ID, name, role, and assigned tasks.
Booking details including booking ID, guest ID, room ID, check-in, and check-out dates.
Service requests logged by guests, including request ID, guest ID, details, and fulfillment status.


Business Rules:
Each room can have only one active booking at a time.
Staff can be assigned to multiple roles but have a primary role.
Service requests must be linked to an existing guest booking.


Requirements

Guest Profiles:
Guest ID (unique identifier)
Name
Contact Information (email, phone)
Booking History (link to Booking Details)
Loyalty Program Membership (optional)

Room Details:
Room ID (unique identifier)
Room Type (e.g., Single, Double, Suite)
Status (Occupied/Vacant)
Cleaning Schedule
Room Features (e.g., WiFi, TV)

Staff Information:
Employee ID (unique identifier)
Name
Role (e.g., Receptionist, Housekeeping)
Contact Information
Assigned Tasks (link to Service Requests)

Booking Details:
Booking ID (unique identifier)
Guest ID (foreign key)
Room ID (foreign key)
Check-in Date
Check-out Date
Payment Status

Service Requests:
Request ID (unique identifier)
Booking ID (foreign key)
Description of Request
Assigned Staff ID (foreign key)
Fulfillment Status

Room Rate Table:
Room Type
Rate Per Night
Seasonal Adjustments (optional)


Business Rules and Constraints

Guest Constraints:
Each guest must have a unique Guest ID.
Contact information must be valid and verified.

Room Constraints:
Each room is uniquely identified by a Room ID.
Room Status must be accurately updated with each check-in and check-out.
Cleaning schedules must be maintained and logged.

Staff Constraints:
Each staff member must have a unique Employee ID.
Staff can have multiple roles but one primary role.
Staff assignments must be linked to valid service requests or tasks.

Booking Constraints:
Each booking must have a unique Booking ID.
A room can have only one active booking at a time.
Check-in and check-out dates must be within the hotel's operational calendar.

Service Request Constraints:

Each service request must be linked to a valid booking.
Requests must be assigned to available staff members.
Fulfillment status must be tracked and updated.
General Constraints:

All IDs (Guest ID, Room ID, Employee ID, Booking ID, Request ID) must be unique and non-null.
Ensure data integrity across linked tables (e.g., Bookings, Guest Profiles, Room Details).


Additional Features
Online Booking Interface:

Allow guests to book rooms online, including room selection and special requests.
Staff Scheduling System:

Automated scheduling for staff based on hotel occupancy and individual workload.
Customer Relationship Management (CRM):

Tools for tracking guest preferences, feedback, and loyalty program details.
Dynamic Pricing Module:

Adjust room rates based on demand, season, and special events.
Maintenance and Cleaning Tracking:

System for logging and tracking room maintenance and cleaning schedules.
Security and Privacy Measures:

Strong data protection protocols to ensure guest privacy and data security.





Use Case 5: Public Library System
Scenario: A public library requires a database to manage its collection of books, member information, loan records, and event scheduling.

Requirements:
Book catalog with book ID, title, author, genre, and availability status.
Member profiles including member ID, name, contact details, and borrowing history.
Loan records detailing loan ID, book ID, member ID, checkout date, and due date.
Event calendar for library events, including event ID, name, date, time, and attendee limit.
Relationships between books and genres, and members and loan records.


Business Rules:
Each book can be borrowed by one member at a time.
Members can have multiple active loans but with a maximum limit.
Events have a maximum attendee capacity based on the library's space limitations.

Requirements

Book Catalog table:
Book ID (unique identifier)
Title
Author(s)
Genre ID (foreign key to a Genres table)
Availability Status (Available, Borrowed, Under Maintenance)
ISBN Number
Publication Year

Member Profiles table:
Member ID (unique identifier)
Name
Contact Details (email, phone)
Address
Registration Date
Membership Status (Active, Suspended, Expired)

Loan Records table:
Loan ID (unique identifier)
Book ID (foreign key)
Member ID (foreign key)
Checkout Date
Due Date
Return Date (optional)

Event Calendar table:
Event ID (unique identifier)
Name
Description
Date
Time
Location
Attendee Limit
Registration List (link to Member IDs)

Genres Table:
Genre ID (unique identifier)
Genre Name

Relationship Tables:
Book-Genre Relationships
Member-Loan Relationships


Business Rules and Constraints
Book Constraints:

Each book must have a unique Book ID and ISBN Number.
Availability Status must be accurately updated with each loan and return.
Member Constraints:

Each member is uniquely identified by a Member ID.
Contact details must be valid and up-to-date.
Members must adhere to the library's borrowing policies.
Loan Constraints:

Each loan must have a unique Loan ID.
A book can be borrowed by only one member at a time.
Due Date must be set according to the library's loan duration policy.
Return Date, if applicable, should be recorded upon book return.
Event Constraints:

Each event must have a unique Event ID.
Attendee limit must not exceed the library’s space capacity.
Event registration should be managed and updated in real time.
General Constraints:

All IDs (Book ID, Member ID, Loan ID, Event ID, Genre ID) must be unique and non-null.
Relationships between books and genres, and members and loans must be consistently maintained.

Additional Features
Online Catalog Access:

Allow members to search, browse, and reserve books online.
Automated Reminder System:

Send reminders for upcoming due dates and overdue items.
Membership Management:

Tools for tracking membership status, renewals, and suspensions.
Event Management Module:

Online registration for events, tracking of attendance, and feedback collection.
Reporting and Analytics:

Reports on borrowing trends, popular genres, and member engagement.
Security and Privacy Measures:

Ensure data protection and privacy of member information in compliance with relevant regulations.
