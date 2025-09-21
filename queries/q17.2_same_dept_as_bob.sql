-- Q17.2: Employees in the same department as Bob
SELECT EmpName, DeptID
FROM Employees
WHERE DeptID = (
    SELECT DeptID
    FROM Employees
    WHERE EmpName = 'Bob'
);
