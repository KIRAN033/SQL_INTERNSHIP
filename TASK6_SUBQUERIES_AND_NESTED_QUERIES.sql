
select * from emp;

-- Subquery in SELECT 
SELECT 
  FirstName, LastName, Salary,
  (SELECT MAX(Salary) FROM emp) AS HighestSalary
FROM emp;


--Subquery in WHERE clause
SELECT FirstName, LastName, Salary
FROM emp
WHERE Salary = (SELECT MAX(Salary) FROM emp);


--Subquery in FROM clause
SELECT Department, AvgSalary
FROM (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM emp
    GROUP BY Department
) AS DeptAvgs;

--Subquery using IN
SELECT FirstName, LastName, Department
FROM emp
WHERE Department IN (
    SELECT DISTINCT Department
    FROM emp
    WHERE Salary > 70000
);


--Subquery using EXISTS
SELECT FirstName, LastName, Department
FROM emp e
WHERE EXISTS (
    SELECT 1
    FROM emp sub
    WHERE sub.Department = e.Department
      AND sub.HireDate < '2019-01-01'
);





