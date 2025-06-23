
-- Create schema
CREATE DATABASE library_management;

-- Use the schema
USE library_management;

-- TABLE: EMPLOYEES
CREATE TABLE EMPLOYEES (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Date_of_hire DATE,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES JOB_ROLES(role_id)
);

-- TABLE: BRANCHES
CREATE TABLE BRANCHES (
    Branch_ID INT AUTO_INCREMENT PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Phone_Number VARCHAR(20),
    Email VARCHAR(100)
);

-- TABLE: BOOKS
CREATE TABLE BOOKS (
    Book_id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Genre VARCHAR(50),
    Publisher VARCHAR(100),
    Publication_Date DATE
);

-- TABLE: BOOK_COPIES
CREATE TABLE BOOK_COPIES (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    Book_ID INT NOT NULL,
    Status VARCHAR(50),
    Due_Date DATE,
    Branch_id INT NOT NULL,
    FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES BRANCHES(Branch_ID)
);

-- TABLE: MEMBERS
CREATE TABLE MEMBERS (
    Member_id INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Membership_expiration_date DATE
);

-- TABLE: CHECKOUTS
CREATE TABLE CHECKOUTS (
    checkout_id INT AUTO_INCREMENT PRIMARY KEY,
    Copy_ID INT NOT NULL,
    Checkout_date DATE,
    Return_date DATE,
    Due_date DATE,
    Members_id INT NOT NULL,
    FOREIGN KEY (Copy_ID) REFERENCES BOOK_COPIES(copy_id),
    FOREIGN KEY (Members_id) REFERENCES MEMBERS(Member_id)
);

-- TABLE: INVENTORY
CREATE TABLE INVENTORY (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Book_ID INT NOT NULL,
    Quantity INT,
    Date_Added DATE,
    Date_Modified DATE,
    Branches_id INT NOT NULL,
    FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_id),
    FOREIGN KEY (Branches_id) REFERENCES BRANCHES(Branch_ID)
);

-- TABLE: FINE
CREATE TABLE FINE (
    Fine_ID INT AUTO_INCREMENT PRIMARY KEY,
    Copy_ID INT NOT NULL,
    Fine_Amount DECIMAL(10, 2),
    Fine_Date DATE,
    Status VARCHAR(50),
    Members_id INT NOT NULL,
    FOREIGN KEY (Copy_ID) REFERENCES BOOK_COPIES(copy_id),
    FOREIGN KEY (Members_id) REFERENCES MEMBERS(Member_id)
);
-- TABLE: JOB_ROLES
CREATE TABLE JOB_ROLES (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    Role_name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);