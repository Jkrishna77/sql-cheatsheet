-- Names starting with B or D
SELECT EmpName
FROM Employees
WHERE EmpName LIKE 'B%' OR EmpName LIKE 'D%';
