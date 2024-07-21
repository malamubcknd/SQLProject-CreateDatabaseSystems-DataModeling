-- Insert into genres
INSERT INTO genres (g_genrename)
VALUES
    ('Fiction'),
    ('Science Fiction'),
    ('Mystery'),
    ('Romance'),
    ('History'),
    ('Biography'),
    ('Science'),
    ('Fantasy'),
    ('Self-Help'),
    ('Thriller');

-- Insert into books
INSERT INTO books (b_title, b_authors, genre_id, b_availabilitystatus, b_isbnnumber, b_publicationyear)
VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1, 'Available', '9780141182636', 1925),
    ('Dune', 'Frank Herbert', 2, 'Available', '9780441172719', 1965),
    ('The Da Vinci Code', 'Dan Brown', 3, 'Borrowed', '9780307474278', 2003),
    ('Pride and Prejudice', 'Jane Austen', 4, 'Available', '9780141439518', 1813),
    ('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 5, 'Available', '9780062316097', 2014),
    ('Steve Jobs', 'Walter Isaacson', 6, 'Under Maintenance', '9781501127625', 2011),
    ('A Brief History of Time', 'Stephen Hawking', 7, 'Available', '9780553380163', 1988),
    ('The Hobbit', 'J.R.R. Tolkien', 8, 'Available', '9780345339683', 1937),
    ('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 9, 'Available', '9781982137274', 1989),
    ('The Girl with the Dragon Tattoo', 'Stieg Larsson', 10, 'Borrowed', '9780307454546', 2005);

-- Insert into members
INSERT INTO members (m_firstname, m_surname, m_contact, m_email, m_street, m_city, m_postalcode, m_country, m_registrationdate, m_membershipstatus)
VALUES
    ('John', 'Doe', '1234567890', 'john.doe@email.com', '123 Main St', 'Cityville', '12345', 'Countryland', '2022-01-15', 'Active'),
    ('Jane', 'Smith', '9876543210', 'jane.smith@email.com', '456 Oak St', 'Townsville', '54321', 'Landia', '2022-02-01', 'Suspended'),
    ('Bob', 'Johnson', '2345678901', 'bob.johnson@email.com', '789 Pine St', 'Villageton', '67890', 'Territory', '2022-02-15', 'Active'),
    ('Alice', 'Williams', '3456789012', 'alice.williams@email.com', '101 Cedar St', 'Citytown', '01234', 'Countryside', '2022-03-01', 'Expired'),
    ('Charlie', 'Davis', '4567890123', 'charlie.davis@email.com', '202 Elm St', 'Hamletville', '56789', 'Landland', '2022-03-15', 'Active'),
    ('Eva', 'Martin', '5678901234', 'eva.martin@email.com', '303 Maple St', 'Villageville', '45678', 'Territoria', '2022-04-01', 'Suspended'),
    ('David', 'Taylor', '6789012345', 'david.taylor@email.com', '404 Birch St', 'Cityburg', '34567', 'Countryton', '2022-04-15', 'Active'),
    ('Grace', 'Anderson', '7890123456', 'grace.anderson@email.com', '505 Pine St', 'Villageton', '23456', 'Territoriland', '2022-05-01', 'Suspended'),
    ('Henry', 'Miller', '8901234567', 'henry.miller@email.com', '606 Oak St', 'Townville', '12345', 'Landton', '2022-05-15', 'Active'),
    ('Isabel', 'Clark', '9012345678', 'isabel.clark@email.com', '707 Elm St', 'Cityton', '98765', 'Countryburg', '2022-06-01', 'Expired');

-- Insert into loans
INSERT INTO loans (book_id, member_id, l_checkoutdate, l_duedate, l_returndate)
VALUES
    (1, 1, '2022-02-01', '2022-02-15', NULL),
    (3, 2, '2022-03-01', '2022-03-15', NULL),
    (5, 3, '2022-04-01', '2022-04-15', '2022-04-10'),
    (7, 4, '2022-05-01', '2022-05-15', '2022-05-08'),
    (9, 5, '2022-06-01', '2022-06-15', NULL),
    (2, 6, '2022-07-01', '2022-07-15', '2022-07-10'),
    (4, 7, '2022-08-01', '2022-08-15', NULL),
    (6, 8, '2022-09-01', '2022-09-15', '2022-09-10'),
    (8, 9, '2022-10-01', '2022-10-15', '2022-10-05'),
    (10, 10, '2022-11-01', '2022-11-15', NULL);

-- Insert into events
INSERT INTO events (e_eventnamt, e_eventdescription, e_date, e_time, e_location, e_attendeelimit, e_registrationlist)
VALUES
    ('Book Club Meeting', 'Discussing latest reads', '2022-02-20', '18:00:00', 'Library Meeting Room', 20, '{1, 3, 5, 7, 9}'),
    ('Author Q&A Session', 'Meet the author of "Sapiens"', '2022-03-15', '19:30:00', 'Main Auditorium', 50, '{2, 4, 6, 8, 10}'),
    ('Storytelling Workshop', 'Learn the art of storytelling', '2022-04-10', '15:00:00', 'Storytelling Corner', 30, '{1, 3, 5, 7, 9}'),
    ('Science Fiction Symposium', 'Exploring the wonders of science fiction', '2022-05-05', '16:30:00', 'Sci-Fi Lounge', 40, '{2, 4, 6, 8, 10}'),
    ('Romance Book Signing', 'Meet your favorite romance authors', '2022-06-02', 'Bookstore', 25, '{1, 3, 5, 7, 9}'),
    ('History Lecture Series', 'Unraveling historical mysteries', '2022-07-20', 'History Hall', 35, '{2, 4, 6, 8, 10}'),
    ('Fantasy Movie Night', 'Screening fantasy classics', '2022-08-15', 'Outdoor Theater', 50, '{1, 3, 5, 7, 9}'),
    ('Self-Help Seminar', 'Empower yourself with self-help tips', '2022-09-10', 'Seminar Room', 30, '{2, 4, 6, 8, 10}'),
    ('Thriller Escape Room', 'Solve the mystery and escape the room', '2022-10-05', 'Escape Room Center', 20, '{1, 3, 5, 7, 9}'),
    ('Science Book Fair', 'Explore the latest in science literature', '2022-11-01', 'Exhibition Hall', 40, '{2, 4, 6, 8, 10}');

-- Insert into book-genre relationships
INSERT INTO bookgenrerelationships (book_id, genre_id)
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

-- Insert into member-loan relationships
INSERT INTO memberloanrelationships (member_id, loan_id)
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