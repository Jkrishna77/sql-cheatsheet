-- Q9.4: Total salary per department
SELECT d.DeptName, SUM(e.Salary) AS TotalSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
