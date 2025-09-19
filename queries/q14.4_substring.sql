-- Q14.4: First 3 characters of employee names
SELECT EmpName, SUBSTRING(EmpName, 1, 3) AS ShortName
FROM Employees;
