-- Q14.11: Replace 'a' with '@' in employee names
SELECT EmpName, REPLACE(EmpName, 'a', '@') AS ModifiedName
FROM Employees;
