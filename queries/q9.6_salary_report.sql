-- Q9.6: Department salary report with multiple aggregates
SELECT 
    d.DeptName,
    SUM(e.Salary) AS TotalSalary,
    ROUND(AVG(e.Salary), 2) AS AvgSalary,
    MAX(e.Salary) AS MaxSalary,
    MIN(e.Salary) AS MinSalary
FROM Employees e
INNER JOIN Departments d
  ON e.DeptID = d.DeptID
GROUP BY d.DeptName;
