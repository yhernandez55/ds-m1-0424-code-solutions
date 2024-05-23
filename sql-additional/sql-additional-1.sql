USE hr;

SELECT * FROM employee e;

# 1
SELECT Attrition, Department, Gender, JobRole, MonthlyIncome 
FROM employee e;

#2
SELECT Attrition AS attr, Department AS dep, Gender AS sex, JobRole AS title, MonthlyIncome AS m_income
FROM employee e;

# 3
SELECT MaritalStatus , OverTime , TotalWorkingYears 
FROM employee e;

# 4
SELECT JobRole, MonthlyIncome 
FROM employee e
ORDER BY MonthlyIncome DESC 
LIMIT 3;

# 5
SELECT Department , TotalWorkingYears 
FROM employee e
ORDER BY TotalWorkingYears DESC 
LIMIT 3;

# 6
SELECT Department, Age
FROM employee e
ORDER BY Age ASC
LIMIT 3;

# 7
SELECT DISTINCT Department
FROM employee e;

# 8
SELECT COUNT(*) AS total_rows
FROM employee e;

# 9
SELECT COUNT(DISTINCT JobRole) AS UniqueJobRoles
FROM employee e;

# 10
SELECT Attrition, Department, Gender, JobRole, EmployeeNumber 
FROM employee e
WHERE Department = 'Sales';

# 11
SELECT EmployeeNumber, Department, EducationField, MaritalStatus, Attrition
FROM employee e
WHERE EducationField = 'Life Sciences';

# 12
SELECT EmployeeNumber, Department, HourlyRate, JobRole, Attrition
FROM employee e
WHERE HourlyRate > 65
ORDER BY HourlyRate DESC;

# 13
SELECT EmployeeNumber, JobRole
FROM employee e
WHERE JobRole LIKE '%Technician%';

# 14
SELECT EmployeeNumber, JobRole
FROM employee e
WHERE JobRole LIKE '%Representative%';

# 15
SELECT EmployeeNumber, JobRole
FROM employee e
WHERE JobRole LIKE '%Research%';
