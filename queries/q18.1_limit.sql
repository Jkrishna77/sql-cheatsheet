-- Q18.1: Top 2 highest salaries
SELECT EmpName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 2;