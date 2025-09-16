-- Q6: Employees with department names
SELECT e.EmpName, d.DeptName
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID;
