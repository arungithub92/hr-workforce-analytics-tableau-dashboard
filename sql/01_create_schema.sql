CREATE DATABASE IF NOT EXISTS hr_workforce_analytics;
USE hr_workforce_analytics;
DROP TABLE IF EXISTS attrition;
DROP TABLE IF EXISTS headcount_monthly;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
 employee_id VARCHAR(10) PRIMARY KEY, department VARCHAR(60), location VARCHAR(60), job_level VARCHAR(40),
 employment_type VARCHAR(30), hire_date DATE, gender VARCHAR(30), annual_salary_inr INT,
 manager_id VARCHAR(10), performance_rating INT, engagement_score INT
);
CREATE TABLE headcount_monthly(
 snapshot_month DATE, employee_id VARCHAR(10), department VARCHAR(60), location VARCHAR(60),
 job_level VARCHAR(40), employment_type VARCHAR(30),
 PRIMARY KEY(snapshot_month,employee_id)
);
CREATE TABLE attrition(
 employee_id VARCHAR(10) PRIMARY KEY, termination_date DATE, department VARCHAR(60), location VARCHAR(60),
 job_level VARCHAR(40), termination_reason VARCHAR(60), regrettable_flag TINYINT
);
CREATE INDEX idx_employee_dept ON employees(department);
CREATE INDEX idx_attrition_date ON attrition(termination_date);
