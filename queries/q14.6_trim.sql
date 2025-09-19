-- Q14.6: Remove leading and trailing spaces from names
SELECT EmpName, TRIM(EmpName) AS TrimmedName
FROM Employees;
