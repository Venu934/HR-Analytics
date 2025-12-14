/* =====================================
   ATTRITION & RETENTION ANALYSIS
   ===================================== */

-- Total employees
SELECT COUNT(*) AS TotalEmployees
FROM employeeHireDate;

-- Currently active employees
SELECT COUNT(*) AS ActiveEmployees
FROM employeeHireDate
WHERE ExitDate IS NULL;

-- Employees who exited the company
SELECT COUNT(*) AS ExitedEmployees
FROM employeeHireDate
WHERE ExitDate IS NOT NULL;

-- Department-wise active employees
SELECT d.DepartmentType,
       COUNT(*) AS ActiveEmployeeCount
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
WHERE h.ExitDate IS NULL
GROUP BY d.DepartmentType;

-- Department-wise exited employees
SELECT d.DepartmentType,
       COUNT(*) AS ExitedEmployeeCount
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
WHERE h.ExitDate IS NOT NULL
GROUP BY d.DepartmentType;

-- Retention rate by department
SELECT d.DepartmentType,
       SUM(CASE WHEN h.ExitDate IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS RetentionRate
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
GROUP BY d.DepartmentType
ORDER BY RetentionRate DESC;
