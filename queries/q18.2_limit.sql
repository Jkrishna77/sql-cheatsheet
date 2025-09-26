-- Q18.2: Bottom 2 lowest salaries
SELECT EmpName, Salary
FROM Employees
ORDER BY Salary ASC
LIMIT 2;