-- =========================================================
-- Library Management System Database Schema (MySQL)
-- Description: SQL script to create tables and relationships
--              for a Library Management System.
-- =========================================================

-- ===================
-- Drop tables if exist (for development/testing)
-- ===================
DROP TABLE IF EXISTS book_authors;
DROP TABLE IF EXISTS borrowings;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS staff;

-- ===================
-- 1. Staff Table
-- ===================
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
);

-- ===================
-- 2. Members Table
-- ===================
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE())
);

-- ===================
-- 3. Authors Table
-- ===================
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- ===================
-- 4. Books Table
-- ===================
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    publisher VARCHAR(100),
    year_published INT,
    category VARCHAR(50),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1
);

-- ===================
-- 5. Book_Authors Table (Many-to-Many)
-- ===================
CREATE TABLE book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- ===================
-- 6. Borrowings Table
-- ===================
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    staff_id INT,
    borrow_date DATE NOT NULL DEFAULT (CURRENT_DATE()),
    due_date DATE NOT NULL,
    return_date DATE,
    -- Constraints
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE SET NULL
);

-- ===================
-- Indexes for Performance
-- ===================
CREATE INDEX idx_books_category ON books(category);
CREATE INDEX idx_borrowings_due_date ON borrowings(due_date);

-- =========================================================
-- End of Schema
-- =========================================================
