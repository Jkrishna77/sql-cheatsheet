-- Q2: Employees with salary > 55000, highest first
SELECT EmpName, Salary
FROM Employees
WHERE Salary > 55000
ORDER BY Salary DESC;
