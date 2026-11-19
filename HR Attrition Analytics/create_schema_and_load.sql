-- =====================================================================
-- HR Attrition & Workforce Analytics  |  Database: hr_attrition
-- Requires MySQL 8.0+ (CTEs and window functions are used in the questions)
-- =====================================================================
-- STEP 1: replace C:/path/to/data/ in every LOAD DATA statement with your CSV folder
--         (use forward slashes, even on Windows, e.g. 'C:/projects/data/')
-- STEP 2: enable local file loading once:  SET GLOBAL local_infile = 1;
--         and connect with local infile allowed (Workbench: Connection ->
--         Advanced -> Others -> OPT_LOCAL_INFILE=1; CLI: mysql --local-infile=1 -u root -p)
-- If LOAD DATA is blocked on your machine, use Workbench's
--   "Table Data Import Wizard" (right-click the table -> Table Data Import Wizard)
-- If you edited the CSVs in Excel on Windows, change '\n' to '\r\n' in LINES TERMINATED BY.
-- NOTE: no FOREIGN KEY is declared on employees.dept_id on purpose, so that the index exercise (Q18) shows a clear before/after EXPLAIN.
-- =====================================================================

DROP DATABASE IF EXISTS hr_attrition;
CREATE DATABASE hr_attrition CHARACTER SET utf8mb4;
USE hr_attrition;

-- >>> Replace 'C:/path/to/data/' in every LOAD DATA statement below with your own folder path.

CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50),
  location VARCHAR(30)
);

CREATE TABLE salary_bands (
  job_level INT PRIMARY KEY,
  band_min INT,
  band_max INT
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  gender VARCHAR(10),
  age INT,
  marital_status VARCHAR(15),
  education VARCHAR(20),
  dept_id INT,
  job_role VARCHAR(50),
  job_level INT,
  hire_date DATE,
  exit_date DATE,
  monthly_income INT,
  overtime VARCHAR(3),
  job_satisfaction INT,
  work_life_balance INT,
  performance_rating INT,
  years_since_last_promotion INT,
  distance_from_home_km INT,
  training_hours_last_year INT,
  attrition VARCHAR(3)
);

CREATE TABLE exit_interviews (
  interview_id INT PRIMARY KEY,
  emp_id INT,
  exit_reason VARCHAR(40),
  would_recommend VARCHAR(3)
);

-- ---------------------------------------------------------------
-- LOAD DATA (parents first, children last). Empty CSV cells become NULL.
-- ---------------------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/path/to/data/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(dept_id, dept_name, location);

LOAD DATA LOCAL INFILE 'C:/path/to/data/salary_bands.csv'
INTO TABLE salary_bands
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(job_level, band_min, band_max);

LOAD DATA LOCAL INFILE 'C:/path/to/data/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(emp_id, gender, age, marital_status, education, dept_id, job_role, job_level, hire_date, @exit_date, monthly_income, overtime, @job_satisfaction, work_life_balance, performance_rating, years_since_last_promotion, distance_from_home_km, training_hours_last_year, attrition)
SET exit_date = NULLIF(@exit_date, ''), job_satisfaction = NULLIF(@job_satisfaction, '');

LOAD DATA LOCAL INFILE 'C:/path/to/data/exit_interviews.csv'
INTO TABLE exit_interviews
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(interview_id, emp_id, exit_reason, would_recommend);

-- ---------------------------------------------------------------
-- Quick check after loading
-- ---------------------------------------------------------------
SELECT 'departments' AS table_name, COUNT(*) AS row_count FROM departments
UNION ALL
SELECT 'salary_bands' AS table_name, COUNT(*) AS row_count FROM salary_bands
UNION ALL
SELECT 'employees' AS table_name, COUNT(*) AS row_count FROM employees
UNION ALL
SELECT 'exit_interviews' AS table_name, COUNT(*) AS row_count FROM exit_interviews;
