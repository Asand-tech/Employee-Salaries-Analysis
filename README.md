# Employee-Salaries-Analysis
Salary data isn’t just about numbers—it’s about fairness, growth, and strategic decisions. I built this project using pure SQL to explore employee compensation across departments, grades, and genders, uncovering patterns that HR teams and executives can act on.

This wasn’t just a technical exercise. It was a deep dive into the story behind paychecks: Who earns the most? Where is salary growth happening? Is longevity rewarded? Are pay gaps real?

🧠 What I Did
Using a series of structured SQL queries, I explored and analyzed the employee_salaries table from the employee_salary_analysis schema. Here's how I approached it:

🔍 Key Insights & Queries
1. Data Exploration
sql
SELECT * FROM employee_salary_analysis.employee_salaries LIMIT 10;
→ Previewed the dataset to understand structure and key columns.

2. Employee Distribution by Department
sql
SELECT department, COUNT(*) AS total_employees
FROM employee_salary_analysis.employee_salaries
GROUP BY department;
→ Identified departments with the largest and smallest headcounts.

3. Average Salary by Department
sql
SELECT department, AVG(base_salary)
FROM employee_salary_analysis.employee_salaries
GROUP BY department
ORDER BY AVG(base_salary) DESC;
→ Highlighted departments with the highest average base salaries. Finance and IT topped the list, while Support and Admin lagged behind.

4. Top Earners by Department (Total Compensation)
sql
SELECT department, MAX(base_salary + overtime_pay + longevity_pay)
FROM employee_salary_analysis.employee_salaries
GROUP BY department
ORDER BY MAX(base_salary + overtime_pay + longevity_pay) DESC
LIMIT 10;
→ Revealed which departments house the highest-paid individuals.

5. Gender Pay Analysis
sql
SELECT gender, AVG(base_salary)
FROM employee_salary_analysis.employee_salaries
GROUP BY gender;
→ Compared average salaries between genders. Found disparities in certain roles, prompting equity discussions.

6. Total Salary Calculation
sql
ALTER TABLE employee_salary_analysis.employee_salaries
ADD COLUMN total_salary DECIMAL(10,2);

UPDATE employee_salary_analysis.employee_salaries
SET total_salary = base_salary + longevity_pay + overtime_pay;
→ Created a new column to reflect full compensation.

7. Percentage Salary Increase
sql
SELECT department, base_salary, total_salary,
ROUND(((total_salary - base_salary) / base_salary) * 100, 2) AS percentage_increase
FROM employee_salary_analysis.employee_salaries
ORDER BY percentage_increase DESC
LIMIT 10;
→ Measured how much overtime and longevity boosted salaries. Some roles saw increases over 30%, showing the impact of tenure and extra hours.

8. Grade-Level Salary Analysis
sql
SELECT grade, AVG(base_salary)
FROM employee_salary_analysis.employee_salaries
GROUP BY grade;
→ Mapped salary progression across job grades.

9. Longevity Pay Impact
sql
SELECT department, longevity_pay, total_salary,
ROUND((longevity_pay / total_salary) * 100, 2) AS longevity_impact
FROM employee_salary_analysis.employee_salaries
ORDER BY longevity_impact DESC;
→ Quantified how much of total salary comes from longevity bonuses. Departments with long-tenured staff showed higher percentages.

🛠️ Tools Used
SQL (PostgreSQL): All analysis was performed using SQL only—no external tools.

📈 What I Learned
How to use window functions, aggregations, and conditional logic to extract meaningful insights.

The importance of data storytelling—structuring queries to answer real business questions.

That compensation data can reveal much more than just numbers—it reflects culture, priorities, and opportunities.

🌟 Future Enhancements
Add tenure and performance metrics to correlate pay with contribution.

Visualize results in Power BI for executive dashboards.

Automate monthly salary audits using stored procedures.
