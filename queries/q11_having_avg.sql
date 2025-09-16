-- Q11: Departments with average salary greater than 50,000
SELECT d.DeptName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName
HAVING AVG(e.Salary) > 50000;
