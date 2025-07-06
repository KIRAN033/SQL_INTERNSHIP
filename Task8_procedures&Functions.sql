--Create a Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);


--Stored Procedure in SQL Server
CREATE PROCEDURE GetEmployeesByDepartment
    @DeptID INT
AS
BEGIN
    SELECT * FROM Employees WHERE DepartmentID = @DeptID;
END;

--How to Execute
EXEC GetEmployeesByDepartment @DeptID = 2;


--Function in SQL Server
CREATE FUNCTION GetAnnualSalary
(
    @EmpID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @AnnualSalary DECIMAL(10, 2);
    
    SELECT @AnnualSalary = Salary * 12
    FROM Employees
    WHERE EmpID = @EmpID;

    RETURN @AnnualSalary;
END;


-- How to Use
SELECT dbo.GetAnnualSalary(1) AS AnnualSalary;
