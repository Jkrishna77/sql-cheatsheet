-- Q17.3: Employees earning more than the minimum salary in IT department
SELECT EmpName, Salary
FROM Employees
WHERE Salary > (
    SELECT MIN(Salary)
    FROM Employees
    WHERE DeptID = (
        SELECT DeptID
        FROM Departments
        WHERE DeptName = 'IT'
    )
);
