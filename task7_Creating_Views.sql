CREATE TABLE Emp (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Emp(EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
(1, 'John', 'Doe', 'IT', 75000, '2020-01-15'),
(2, 'Jane', 'Smith', 'HR', 50000, '2019-03-22'),
(3, 'Mark', 'Johnson', 'Finance', 62000, '2021-06-10'),
(4, 'Lucy', 'Brown', 'IT', 48000, '2022-07-01'),
(5, 'Emma', 'Davis', 'Marketing', 55000, '2023-01-12');


--CREATE VIEW
CREATE VIEW IT_HighEarners AS
SELECT FirstName, LastName, Salary
FROM Emp
WHERE Department = 'IT' AND Salary > 50000;

--USE A VIEW
SELECT * FROM IT_HighEarners;
