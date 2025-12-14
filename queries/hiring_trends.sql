/* =====================================
   HIRING TRENDS ANALYSIS
   ===================================== */

-- Hires per year
SELECT YEAR(StartDate) AS HireYear,
       COUNT(*) AS HireCount
FROM employeeHireDate
GROUP BY YEAR(StartDate)
ORDER BY HireYear;

-- Hires per year by department
SELECT d.DepartmentType,
       YEAR(h.StartDate) AS HireYear,
       COUNT(*) AS HireCount
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
WHERE h.StartDate IS NOT NULL
GROUP BY d.DepartmentType, YEAR(h.StartDate)
ORDER BY d.DepartmentType, HireYear;

-- Monthly hiring by department
SELECT d.DepartmentType,
       FORMAT(h.StartDate, 'MMMM') AS HireMonth,
       COUNT(*) AS HireCount
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
GROUP BY d.DepartmentType, FORMAT(h.StartDate, 'MMMM')
ORDER BY d.DepartmentType, HireMonth;
