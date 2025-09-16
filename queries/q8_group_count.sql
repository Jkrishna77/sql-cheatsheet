-- Q8: Count employees in each department
SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
