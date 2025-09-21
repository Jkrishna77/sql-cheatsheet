SELECT EmpName, MIN(Salary) AS SecondLowest
FROM Employees
WHERE Salary > (SELECT MIN(Salary) FROM Employees);
