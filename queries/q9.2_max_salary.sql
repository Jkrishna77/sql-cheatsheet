-- Q9.2: Maximum salary per department
SELECT d.DeptName, MAX(e.Salary) AS MaxSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
