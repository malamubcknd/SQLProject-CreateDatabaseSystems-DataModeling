Database Documentation: Library Management System
1. Overview

The Library Management System database is designed to manage information related to books, genres, members, loans, events, and various relationships between these entities. It includes additional features such as online catalog access, reminder notifications, membership management, event registration, and reporting/analytics. The system ensures data integrity, privacy, and effective management of library operations.
2. Table Descriptions
2.1 Genres Table
genres

    Columns:
        genre_id (Primary Key): Unique identifier for each genre.
        g_genrename: Name of the genre.

2.2 Book Catalog Table
books

    Columns:
        book_id (Primary Key): Unique identifier for each book.
        b_title and b_authors: Title and authors of the book.
        genre_id: Foreign key referencing the genre of the book.
        b_availabilitystatus: Availability status of the book (Available, Borrowed, Under Maintenance).
        b_isbnnumber: Unique ISBN number for the book.
        b_publicationyear: Year of publication for the book.

2.3 Member Profiles Table
members

    Columns:
        member_id (Primary Key): Unique identifier for each member.
        m_firstname and m_surname: First and last name of the member.
        m_contact and m_email: Contact information for the member.
        m_street, m_city, m_postalcode, m_country: Address details of the member.
        m_registrationdate: Date of member registration.
        m_membershipstatus: Membership status of the member (Active, Suspended, Expired).

2.4 Loan Records Table
loans

    Columns:
        loan_id (Primary Key): Unique identifier for each loan.
        book_id: Foreign key referencing the book associated with the loan.
        member_id: Foreign key referencing the member associated with the loan.
        l_checkoutdate: Date when the book was checked out.
        l_duedate: Due date for returning the book.
        l_returndate: Date when the book was returned.

2.5 Event Calendar Table
events

    Columns:
        event_id (Primary Key): Unique identifier for each event.
        e_eventname: Name of the event.
        e_eventdescription: Description of the event.
        e_date and e_time: Date and time of the event.
        e_location: Location of the event.
        e_attendeelimit: Limit on the number of attendees for the event.
        e_registrationlist: Foreign key referencing members registered for the event.

2.6 Book-Genre Relationships
bookgenrerelationships

    Columns:
        book_id: Foreign key referencing the book associated with the relationship.
        genre_id: Foreign key referencing the genre associated with the relationship.

2.7 Member-Loan Relationships
memberloanrelationships

    Columns:
        member_id: Foreign key referencing the member associated with the relationship.
        loan_id: Foreign key referencing the loan associated with the relationship.

3. Additional Features
3.1 Online Catalog Access
View: OnlineCatalog

    Columns:
        book_id, b_title, b_authors, b_availabilitystatus, genre_name.
    Purpose:
        Provides an online catalog view with information about books, including availability status and genre.

3.2 Reminder Notifications
Function: send_reminder()
Trigger: remind_upcoming_due_date

    Purpose:
        Sends reminders (email, notifications, etc.) to members for upcoming due dates.
        Trigger executes the function before inserts or updates on the loans table.

3.3 Membership Management
View: MembershipManagement

    Columns:
        member_id, member_name, m_membershipstatus, l_duedate.
    Purpose:
        Provides a view for membership management, displaying member information and upcoming due dates.

3.4 Event Registration
Function: register_for_event()
Trigger: register_member_for_event

    Purpose:
        Allows members to register for events.
        Trigger executes the function before inserts on the events table.

3.5 Reporting and Analytics
View: ReportingAndAnalytics

    Columns:
        b_title, b_publicationyear, genre, borrowing_count.
    Purpose:
        Offers reporting and analytics on book borrowing, including titles, publication years, genres, and borrowing counts.

3.6 Row-Level Security Policy
Policy: member_privacy_policy

    Purpose:
        Ensures member privacy by allowing selection only for the logged-in member.
        Enables row-level security for the members table.

4. Data Insertion Example

sql

-- Insert into genres
INSERT INTO genres (g_genrename) VALUES
    ('Mystery'),
    ('Science Fiction'),
    -- Add more genres as needed...

-- Insert into books
INSERT INTO books (b_title, b_authors, genre_id, b_availabilitystatus, b_isbnnumber, b_publicationyear) VALUES
    ('The Hound of the Baskervilles', 'Arthur Conan Doyle', 1, 'Available', '978-0-141-43980-0', 1902),
    -- Add more books as needed...

-- Insert into members
INSERT INTO members (m_firstname, m_surname, m_contact, m_email, m_street, m_city, m_postalcode, m_country, m_registrationdate, m_membershipstatus) VALUES
    ('John', 'Doe', '1234567890', 'john.doe@email.com', '123 Main St', 'Cityville', '12345', 'Countryland', '2023-01-01', 'Active'),
    -- Add more members as needed...

-- Insert into loans
INSERT INTO loans (book_id, member_id, l_checkoutdate, l_duedate, l_returndate) VALUES
    (1, 1, '2023-01-05', '2023-01-15', '2023-01-12'),
    -- Add more loans as needed...

-- Insert into events
INSERT INTO events (e_eventname, e_eventdescription, e_date, e_time, e_location, e_attendeelimit, e_registrationlist) VALUES
    ('Book Club Meeting', 'Discussing recent reads', '2023-02-01', '18:00', 'Library Meeting Room', 20, NULL),
    -- Add more events as needed...

5. Design Decisions and Challenges
5.1 Data Relationships

    Challenge:
        Managing relationships between books, genres, members, loans, and events.
    Design Decision:
        Utilized foreign keys and relationship tables (bookgenrerelationships, memberloanrelationships) to establish and maintain connections between entities.

5.2 Reminder System

    Challenge:
        Implementing a reminder system for due dates.
    Design Decision:
        Implemented a trigger (remind_upcoming_due_date) and a function (send_reminder()) to notify members of upcoming due dates.

5.3 Membership Management

    Challenge:
        Providing a view for effective membership management.
    Design Decision:
        Created a view (MembershipManagement) that consolidates member information and due dates for easy management.

5.4 Event Registration

    Challenge:
        Allowing members to register for events.
    Design Decision:
        Implemented a trigger (register_member_for_event) and a function (register_for_event()) to facilitate event registration.

5.5 Reporting and Analytics

    Challenge:
        Creating a view for reporting and analytics on book borrowing.
    Design Decision:
        Developed a view (ReportingAndAnalytics) to provide insights into book borrowing patterns.

5.6 Row-Level Security Policy

    Challenge:
        Ensuring member privacy in data access.
    Design Decision:
        Implemented a row-level security policy (member_privacy_policy) to restrict data access to the respective member.