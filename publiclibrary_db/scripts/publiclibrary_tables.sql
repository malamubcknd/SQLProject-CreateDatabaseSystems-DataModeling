-- Genres Table
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    g_genrename VARCHAR(255) NOT NULL
);


-- Book Catalog Table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    b_title VARCHAR(255) NOT NULL,
    b_authors VARCHAR(255) NOT NULL,
    genre_id INT REFERENCES genres(genre_id),
    b_availabilitystatus VARCHAR(50) CHECK (b_availabilitystatus IN ('Available', 'Borrowed', 'Under Maintenance')),
    b_isbnnumber VARCHAR(20) UNIQUE,
    b_publicationyear INTEGER
);


-- Member Profiles Table
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    m_firstname VARCHAR(50),
    m_surname VARCHAR(50),
    m_contact VARCHAR(20) NOT NULL,
    m_email VARCHAR(320) NOT NULL,
    m_street VARCHAR (50) NOT NULL,
    m_city VARCHAR (20) NOT NULL,
    m_postalcode VARCHAR (10) NOT NULL,
    m_country VARCHAR (50) NOT NULL,
    m_registrationdate DATE,
    m_membershipstatus VARCHAR(50) CHECK (m_membershipstatus IN ('Active', 'Suspended', 'Expired'))
);

-- Loan Records Table
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    member_id INT REFERENCES members(member_id),
    l_checkoutdate DATE,
    l_duedate DATE,
    l_returndate DATE,
    UNIQUE (book_id, l_returndate) DEFERRABLE INITIALLY DEFERRED
);


-- Event Calendar Table
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    e_eventnamt VARCHAR(255) NOT NULL,
    e_eventdescription TEXT,
    e_date DATE,
    e_time TIME,
    e_location VARCHAR(255),
    e_attendeelimit INT,
    e_registrationlist INT REFERENCES members(member_id)
);


-- Book-Genre Relationships
CREATE TABLE bookgenrerelationships (
    book_id INT REFERENCES books(book_id),
    genre_id INT REFERENCES genres(genre_id),
    CONSTRAINT bookgenre_id PRIMARY KEY (book_id, genre_id)
);


-- Member-Loan Relationships
CREATE TABLE memberloanrelationships (
    member_id INT REFERENCES members(member_id),
    loan_id INT REFERENCES loans(loan_id),
    CONSTRAINT memberloan_id PRIMARY KEY (member_id, loan_id)
);


-- ADDITIONAL FEATURES

-- View for Online Catalog Access
CREATE OR REPLACE VIEW OnlineCatalog AS
SELECT
    b.book_id,
    b.b_title,
    b.b_authors,
    b.b_availabilitystatus,
    g.g_genrename AS genre_name
FROM
    books b
JOIN
    genres g ON b.genre_id = g.genre_id;


-- Function for Sending Reminders
CREATE OR REPLACE FUNCTION send_reminder()
RETURNS TRIGGER AS $$
BEGIN
    -- Your logic to send reminders (email, notifications, etc.) goes here
    -- Use NEW variable to access the newly inserted/updated row data

    -- Example: Send an email
    -- RAISE NOTICE 'Sending reminder email to member %', NEW.member_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to Execute the Reminder Function
CREATE TRIGGER remind_upcoming_due_date
BEFORE INSERT OR UPDATE ON loans
FOR EACH ROW
EXECUTE FUNCTION send_reminder();


-- View for Membership Management
CREATE OR REPLACE VIEW MembershipManagement AS
SELECT
    m.member_id,
    m.m_firstname || ' ' || m.m_surname AS member_name,
    m.m_membershipstatus,
    l.l_duedate
FROM
    members m
LEFT JOIN
    loans l ON m.member_id = l.member_id;


-- Function for Online Event Registration
CREATE OR REPLACE FUNCTION register_for_event()
RETURNS TRIGGER AS $$
BEGIN
    -- Your logic for event registration goes here
    -- Use NEW variable to access the newly inserted row data

    -- Example: Add member to registration list
    -- UPDATE events SET e_registrationlist = e_registrationlist || NEW.member_id WHERE event_id = NEW.event_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to Execute the Event Registration Function
CREATE TRIGGER register_member_for_event
BEFORE INSERT ON events
FOR EACH ROW
EXECUTE FUNCTION register_for_event();


-- View for Reporting and Analytics
CREATE OR REPLACE VIEW ReportingAndAnalytics AS
SELECT
    b.b_title,
    b.b_publicationyear,
    g.g_genrename AS genre,
    COUNT(l.loan_id) AS borrowing_count
FROM
    books b
JOIN
    genres g ON b.genre_id = g.genre_id
LEFT JOIN
    loans l ON b.book_id = l.book_id
GROUP BY
    b.b_title, b.b_publicationyear, g.g_genrename;


-- Row-Level Security Policy for Member Privacy
CREATE POLICY member_privacy_policy
    FOR SELECT
    USING (current_user = member_id);
ALTER TABLE members ENABLE ROW LEVEL SECURITY;
ALTER TABLE members FORCE ROW LEVEL SECURITY;