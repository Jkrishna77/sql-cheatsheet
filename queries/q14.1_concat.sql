-- Q14.1: Show employee name with their department in one column
SELECT CONCAT(e.EmpName, ' works in ', d.DeptName) AS EmployeeInfo
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID;
