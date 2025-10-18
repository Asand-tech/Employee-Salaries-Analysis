SELECT*
FROM employee_salary_analysis.employee_salaries
LIMIT 10;

-- Data Exploration 
SELECT department , count(*) AS total_employees
FROM employee_salary_analysis.employee_salaries
GROUP BY Department;

-- SALARY ANALYSIS ( salary variation by department / divison )
SELECT Department , avg(Base_Salary)
FROM employee_salary_analysis.employee_salaries
GROUP BY Department
ORDER BY avg(Base_Salary) DESC;

-- Top Departments earners
SELECT department , max(base_salary + overtime_pay + Longevity_pay)
FROM employee_salary_analysis.employee_salaries
GROUP BY Department
ORDER BY max(Base_Salary + Overtime_Pay + Longevity_Pay) DESC 
LIMIT 10;

-- Gender pay Analysis
SELECT gender , avg(base_salary)
FROM employee_salary_analysis.employee_salaries
GROUP BY gender;

-- Impact of overtime and Longevity
-- salary increase
ALTER TABLE employee_salary_analysis.employee_salaries
ADD COLUMN Total_Salary DECIMAL(10,2);
UPDATE employee_salary_analysis.employee_salaries
SET Total_Salary = base_salary + Longevity_Pay + Overtime_Pay;

-- percentage increase
SELECT 
Department,
base_salary,
  Total_Salary,
ROUND(((Total_Salary - base_salary) / base_salary) * 100, 2) AS Percentage_Increase
FROM employee_salary_analysis.employee_salaries
ORDER BY Percentage_Increase DESC
LIMIT 10;
  

-- GRADE LEVEL ANALYSIS
SELECT Grade, AVG(base_salary)
FROM employee_salary_analysis.employee_salaries
 GROUP BY Grade;

-- Longevity impact
SELECT 
  Department, 
  Longevity_Pay, 
  Total_Salary, 
  ROUND((Longevity_Pay / Total_Salary) * 100, 2) AS Longevity_Impact
FROM employee_salary_analysis.employee_salaries
ORDER BY Longevity_Impact DESC;

