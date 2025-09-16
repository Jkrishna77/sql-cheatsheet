-- Q12: Departments with total salary greater than 100,000
SELECT d.DeptName, SUM(e.Salary) AS TotalSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName
HAVING SUM(e.Salary) > 100000;
