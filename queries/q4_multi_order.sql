-- Q4: Employees ordered by DeptID, then salary (high to low)
SELECT EmpName, DeptID, Salary
FROM Employees
ORDER BY DeptID ASC, Salary DESC;
