-- Q10: Departments with more than 1 employee
SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName
HAVING COUNT(e.EmpID) > 1;
