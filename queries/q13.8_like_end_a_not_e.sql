-- Names ending with 'a' but not starting with 'E'
SELECT EmpName
FROM Employees
WHERE EmpName LIKE '%a' AND EmpName NOT LIKE 'E%';
