/* =====================================
   EMPLOYEE TENURE ANALYSIS
   ===================================== */

-- Employees who worked for more than 4 years
SELECT EmpID,
       DATEDIFF(YEAR, StartDate, COALESCE(ExitDate, GETDATE())) AS Tenure_Years
FROM employeeHireDate
WHERE DATEDIFF(YEAR, StartDate, COALESCE(ExitDate, GETDATE())) > 4;

-- Longest serving employee (in years)
SELECT MAX(DATEDIFF(YEAR, StartDate, COALESCE(ExitDate, GETDATE()))) AS MaxTenureYears
FROM employeeHireDate;

-- Average tenure of all employees (in days)
SELECT AVG(DATEDIFF(DAY, StartDate, COALESCE(ExitDate, GETDATE()))) AS AvgTenureDays
FROM employeeHireDate;

-- Average tenure per department
SELECT d.DepartmentType,
       AVG(DATEDIFF(YEAR, h.StartDate, COALESCE(h.ExitDate, GETDATE()))) AS AvgTenureYears
FROM employeeHireDate h
JOIN employeeDepartment d
    ON h.EmpID = d.EmpID
GROUP BY d.DepartmentType;
