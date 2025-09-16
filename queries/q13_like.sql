-- Q13: Employees whose names start with 'A'
SELECT EmpName
FROM Employees
WHERE EmpName LIKE 'A%';
-- The '%' wildcard matches any sequence of characters
-- The '_' wildcard matches any single character
-- 'A%' means starts with 'A', ' %A' means ends with 'A', '%A%' means contains 'A'.