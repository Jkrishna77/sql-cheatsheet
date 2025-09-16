-- Q9.3: Minimum salary per department
SELECT d.DeptName, MIN(e.Salary) AS MinSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
