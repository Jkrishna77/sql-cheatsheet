# Q10 — HAVING vs WHERE (detailed explanation)

**Purpose:**
This note explains the difference between `WHERE` and `HAVING`, why `HAVING` exists, when to use it, and common confusing cases. Examples use the `Employees` / `Departments` sample schema from this repo.

---

## Quick summary (one-line)
- **WHERE** filters **rows** before aggregation (GROUP BY).
- **HAVING** filters **groups** (the results of aggregation) after aggregation.

---

## SQL logical/evaluation order (important)
1. `FROM` (joins)
2. `WHERE` (row-level filters)
3. `GROUP BY` (forms groups)
4. `HAVING` (group-level filters)
5. `SELECT` (projection and aggregates)
6. `ORDER BY` / `LIMIT`

Because `WHERE` runs before `GROUP BY`, it cannot use aggregate functions like `SUM()` or `AVG()` — those are only available after grouping.

---

## WHEN to use which
- Use **WHERE** when you want to filter **individual rows** (e.g., `HireDate > '2020-01-01'`, `DeptID = 2`).
- Use **HAVING** when you want to filter **aggregated results** (e.g., `AVG(Salary) > 50000`, `COUNT(*) > 1`).
- Often you will **use both**: WHERE to narrow down raw rows, then GROUP BY, then HAVING to filter groups.

---

## Example 1 — WHERE (row-level filtering)
**Goal:** For employees hired after 2020-01-01, show department and count of such hires.

```sql
SELECT d.DeptName, COUNT(*) AS HiresAfter2020
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.HireDate > '2020-01-01'
GROUP BY d.DeptName;
```
**Why not HAVING?** Because we want to remove rows (employees older than the date) before counting; `WHERE` reduces the input set used by `GROUP BY`.

---

## Example 2 — HAVING (group-level filtering)
**Goal:** Show departments where the average salary is greater than 55,000.

```sql
SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName
HAVING AVG(e.Salary) > 55000;
```

This uses `HAVING` because `AVG(e.Salary)` is an aggregate value that exists only after grouping.

---

## Common mistake: trying to use aggregates in WHERE
Bad example (this will fail or behave unexpectedly):

```sql
-- WRONG: most DBMS will throw an error
SELECT DeptID
FROM Employees
WHERE AVG(Salary) > 50000
GROUP BY DeptID;
```

**Why it's wrong:** `AVG(Salary)` is an aggregate and isn't defined until rows have been grouped.

**Fix:** Move the condition to `HAVING`:

```sql
SELECT DeptID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 50000;
```

---

## Combined example: WHERE + GROUP BY + HAVING
**Goal:** Among employees hired after 2020, find departments that have at least 2 such hires.

```sql
SELECT d.DeptName, COUNT(*) AS NumRecentHires
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE e.HireDate > '2020-01-01'    -- row-level filter applied first
GROUP BY d.DeptName
HAVING COUNT(*) >= 2;               -- group-level filter applied to results
```

This pattern (filter rows, form groups, then filter groups) is extremely common in reports.

---

## HAVING without GROUP BY
You *can* use `HAVING` without `GROUP BY` in many SQL dialects. The statement treats the entire result as a single group.

```sql
-- Example: check if total employees > 3
SELECT COUNT(*) AS TotalEmployees
FROM Employees
HAVING COUNT(*) > 3;
```

If the condition is true, the query returns one row with the count; otherwise it returns zero rows.

---

## Examples quick reference (copy-paste)
- Filter rows first, then group:

```sql
SELECT DeptName, COUNT(*)
FROM Employees
WHERE HireDate > '2020-01-01'
GROUP BY DeptName;
```

- Group then filter groups:

```sql
SELECT DeptName, AVG(Salary)
FROM Employees
GROUP BY DeptName
HAVING AVG(Salary) > 50000;
```

- Use both:

```sql
SELECT DeptName, COUNT(*)
FROM Employees
WHERE HireDate > '2020-01-01'
GROUP BY DeptName
HAVING COUNT(*) > 1;
```

---
