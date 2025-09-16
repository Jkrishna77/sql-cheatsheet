-- Q9.5: Average salary per department rounded to nearest whole number
SELECT d.DeptName, ROUND(AVG(e.Salary), 0) AS RoundedAvgSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
