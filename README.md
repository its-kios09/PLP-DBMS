# Library Management System (MySQL)

## Description

A relational database system for managing a library’s catalog, members, staff, and book borrowing transactions. This project demonstrates a well-structured MySQL schema with proper constraints and relationships.

## How to Run / Setup

1. Clone this repository.
2. Open the file `library_management_system.sql` in your MySQL client.
3. Execute the SQL script to create the database and tables.

## ERD (Entity-Relationship Diagram)


*You can generate an ERD using tools like dbdiagram.io, MySQL Workbench, etc. and provide a screenshot or link here.*

---

## Tables & Relationships

- **staff**: Library employees (admin, librarian, etc.)
- **members**: People who can borrow books
- **authors**: Book authors
- **books**: Library books
- **book_authors**: Many-to-many link between books and authors
- **borrowings**: Records of borrowed books

---

## Author

