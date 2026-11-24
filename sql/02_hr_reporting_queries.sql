USE hr_workforce_analytics;
-- 1. Headcount by department
SELECT department,COUNT(DISTINCT employee_id) headcount FROM employees GROUP BY department ORDER BY headcount DESC;
-- 2. Headcount by location and job level
SELECT location,job_level,COUNT(*) headcount FROM employees GROUP BY location,job_level ORDER BY location,headcount DESC;
-- 3. Monthly headcount trend
SELECT snapshot_month,COUNT(DISTINCT employee_id) headcount FROM headcount_monthly GROUP BY snapshot_month ORDER BY snapshot_month;
-- 4. Monthly exits
SELECT DATE_FORMAT(termination_date,'%Y-%m') exit_month,COUNT(*) exits
FROM attrition GROUP BY DATE_FORMAT(termination_date,'%Y-%m') ORDER BY exit_month;
-- 5. Annual attrition rate using average opening/closing headcount
WITH monthly AS (
 SELECT snapshot_month,COUNT(DISTINCT employee_id) hc FROM headcount_monthly GROUP BY snapshot_month
), exits AS (
 SELECT COUNT(*) exit_count FROM attrition WHERE termination_date BETWEEN '2025-01-01' AND '2025-12-31'
), bounds AS (
 SELECT MAX(CASE WHEN snapshot_month='2025-01-01' THEN hc END) opening_hc,
        MAX(CASE WHEN snapshot_month='2025-12-01' THEN hc END) closing_hc FROM monthly
)
SELECT exit_count,opening_hc,closing_hc,
 ROUND(100*exit_count/NULLIF((opening_hc+closing_hc)/2,0),2) attrition_rate_pct
FROM exits CROSS JOIN bounds;
-- 6. Attrition by department
SELECT department,COUNT(*) exits,
 SUM(regrettable_flag) regrettable_exits
FROM attrition GROUP BY department ORDER BY exits DESC;
-- 7. Termination reasons
SELECT termination_reason,COUNT(*) exits FROM attrition GROUP BY termination_reason ORDER BY exits DESC;
-- 8. Average tenure of exited employees (years)
SELECT ROUND(AVG(DATEDIFF(termination_date,e.hire_date)/365.25),2) avg_tenure_years
FROM attrition a JOIN employees e ON e.employee_id=a.employee_id;
-- 9. Performance and engagement by department
SELECT department,ROUND(AVG(performance_rating),2) avg_performance,
 ROUND(AVG(engagement_score),1) avg_engagement
FROM employees GROUP BY department ORDER BY avg_engagement DESC;
-- 10. Workforce mix
SELECT employment_type,job_level,COUNT(*) employee_count
FROM employees GROUP BY employment_type,job_level ORDER BY employee_count DESC;
-- 11. Regrettable attrition share
SELECT COUNT(*) total_exits,SUM(regrettable_flag) regrettable_exits,
 ROUND(100*SUM(regrettable_flag)/NULLIF(COUNT(*),0),2) regrettable_exit_pct
FROM attrition;
-- 12. Reconciliation: active employee as-of 2025-12-31 based on hire and termination dates
SELECT COUNT(*) active_headcount
FROM employees e
LEFT JOIN attrition a ON a.employee_id=e.employee_id
WHERE e.hire_date<='2025-12-31'
AND (a.employee_id IS NULL OR a.termination_date>'2025-12-31');
