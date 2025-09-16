-- Q9.1: Average salary per department
SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
