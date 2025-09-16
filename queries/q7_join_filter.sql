-- Q7: Employees who work in the IT department
SELECT e.EmpName, d.DeptName
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
WHERE d.DeptName = 'IT';
