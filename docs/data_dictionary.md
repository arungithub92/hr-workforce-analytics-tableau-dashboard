# Data Dictionary

## employees.csv — employee master (one row per employee)
employee_id (unique key), department, location, job_level, employment_type, hire_date, gender, annual_salary_inr (synthetic), manager_id (synthetic manager key), performance_rating (1–5), engagement_score (45–100).

## headcount_monthly.csv — monthly snapshot (one row per active employee per month)
snapshot_month, employee_id, department, location, job_level, employment_type.

## attrition.csv — exit events (one row per exited employee)
employee_id, termination_date, department, location, job_level, termination_reason, regrettable_flag (synthetic 0/1 flag).
