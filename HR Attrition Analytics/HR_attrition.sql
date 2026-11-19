-- STUDENT ANSWER SHEET | HR Attrition & Workforce Analytics | database: hr_attrition
-- Write each answer query under its question. Run with MySQL Workbench.
USE hr_attrition;

-- ================================================================
-- Q1. Table sizes and headline attrition
-- (a) Return the row count of every table. (b) Return total employees, number of leavers and the
-- overall attrition rate %.
-- ================================================================



-- ================================================================
-- Q2. Data validation checks
-- Write one query that returns a check name and a violation count for each of these: (1) attrition =
-- 'Yes' but exit_date is NULL; (2) attrition = 'No' but exit_date is present; (3) exit_date earlier
-- than hire_date; (4) missing job_satisfaction; (5) leavers without an exit interview; (6)
-- monthly_income outside the employee's salary band.
-- ================================================================



-- ================================================================
-- Q3. Feature view for analysis
-- Create a view v_employee_features that adds to each employee: dept_name, age_band (<30, 30-39,
-- 40-49, 50+), tenure_years, tenure_band (<1 yr, 1-3 yrs, 3-6 yrs, 6-10 yrs, 10+ yrs), compa_ratio
-- (rounded to 2 decimals) and compa_band (<0.90, 0.90-1.10, >1.10). Replace a missing job_satisfaction
-- with 3 (the median). Keep all other employee columns.
-- ================================================================



-- ================================================================
-- Q4. Attrition by department
-- For each department show headcount, leavers and attrition rate %. Rank from highest to lowest rate.
-- ================================================================



-- ================================================================
-- Q5. Highest-attrition job roles
-- Which 5 job roles have the highest attrition rate? Only consider roles with at least 30 employees.
-- ================================================================



-- ================================================================
-- Q6. Age band and gender
-- Show the attrition rate by age band, with separate columns for male and female attrition rates.
-- ================================================================



-- ================================================================
-- Q7. Overtime × satisfaction
-- Compare attrition for employees who work overtime vs not, split by job satisfaction (Low = 1–2, High
-- = 3–4). Show headcount, leavers and attrition %.
-- ================================================================



-- ================================================================
-- Q8. Tenure bands
-- At what point in their career at Nexora do people leave? Show headcount, leavers and attrition % by
-- tenure band (ordered from shortest to longest).
-- ================================================================



-- ================================================================
-- Q9. Pay competitiveness
-- Does being paid below the band midpoint increase attrition? Show headcount and attrition % by compa
-- band, and the average compa-ratio of each band.
-- ================================================================



-- ================================================================
-- Q10. Promotion stagnation
-- Group employees by years since last promotion (0-1, 2-3, 4+) and show attrition % for each group.
-- ================================================================



-- ================================================================
-- Q11. Commute distance
-- Group employees by distance from home (0-10 km, 11-20 km, 21+ km) and compare attrition %.
-- ================================================================



-- ================================================================
-- Q12. Exit reasons
-- (a) What are the exit reasons overall (count, % share, % who would recommend Nexora)? (b) What is
-- the single most common exit reason in each department?
-- ================================================================



-- ================================================================
-- Q13. Build and validate a risk score
-- Create a view v_employee_risk that gives every employee a risk_score: overtime = Yes (+2),
-- job_satisfaction ≤ 2 (+2), years_since_last_promotion ≥ 4 (+1), compa_ratio < 0.90 (+1), age < 30
-- (+1), work_life_balance ≤ 2 (+1). Then validate the score: show headcount and attrition % for score
-- bands Low (0-2), Medium (3-4), High (5+).
-- ================================================================



-- ================================================================
-- Q14. Cost of attrition
-- Using the replacement-cost rule (6 × monthly income), calculate for each department: leavers, total
-- replacement cost, average cost per leaver and the department's share of total cost.
-- ================================================================



-- ================================================================
-- Q15. Current high-risk employees
-- Among current employees (attrition = 'No'), how many have a risk score of 5 or more in each
-- department? Show active headcount, high-risk count, high-risk % and the replacement-cost exposure (6
-- × monthly income of the high-risk group).
-- ================================================================



-- ================================================================
-- Q16. Monthly exits with rolling average
-- Show the number of exits per month in 2024 and a 3-month rolling average. Which months were the
-- worst?
-- ================================================================



-- ================================================================
-- Q17. Stored procedure: high-risk list
-- Create a stored procedure sp_high_risk_employees(IN p_dept VARCHAR(50), IN p_min_score INT) that
-- lists current employees (attrition = 'No') in the given department with risk_score ≥ p_min_score,
-- highest score first. Call it for 'Sales' and a minimum score of 5.
-- ================================================================



-- ================================================================
-- Q18. Index and EXPLAIN
-- HR dashboards constantly filter employees by department and attrition. (a) Run EXPLAIN for SELECT
-- COUNT(*) FROM employees WHERE dept_id = 1 AND attrition = 'Yes'. (b) Create a composite index on
-- employees(dept_id, attrition). (c) Run EXPLAIN again and describe what changed.
-- ================================================================



