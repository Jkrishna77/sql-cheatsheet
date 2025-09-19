-- Q15: Number of days worked since hire date
SELECT EmpName, HireDate,
       DATEDIFF(CURRENT_DATE, HireDate) AS DaysWorked
FROM Employees;
