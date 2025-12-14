/* =====================================
   HEADCOUNT & WORKFORCE DISTRIBUTION
   ===================================== */

-- Total headcount by department
SELECT DepartmentType,
       COUNT(*) AS Headcount
FROM employeeDepartment
GROUP BY DepartmentType
ORDER BY Headcount DESC;

-- Active headcount by department
SELECT d.DepartmentType,
       COUNT(*) AS ActiveHeadcount
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
WHERE h.ExitDate IS NULL
GROUP BY d.DepartmentType;

-- Headcount and retention comparison
SELECT d.DepartmentType,
       COUNT(*) AS TotalHeadcount,
       SUM(CASE WHEN h.ExitDate IS NULL THEN 1 ELSE 0 END) AS ActiveHeadcount,
       SUM(CASE WHEN h.ExitDate IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS RetentionRate
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
GROUP BY d.DepartmentType;

-- EmployeeType distribution by department
SELECT DepartmentType,
       EmployeeType,
       COUNT(*) AS EmployeeCount
FROM employeeDepartment
GROUP BY DepartmentType, EmployeeType
ORDER BY DepartmentType;

-- PayZone distribution
SELECT DepartmentType,
       PayZone,
       COUNT(*) AS PayZoneCount
FROM employeeDepartment
GROUP BY DepartmentType, PayZone
ORDER BY DepartmentType;
