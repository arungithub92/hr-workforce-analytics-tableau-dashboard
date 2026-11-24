# Tableau Dashboard Build Guide

## Data model and grain
- `employees.csv`: one row per employee.
- `headcount_monthly.csv`: one row per employee per monthly snapshot.
- `attrition.csv`: one row per exited employee.
Use Tableau relationships rather than physically joining all three tables into a flat table. Monthly snapshots repeat employee IDs by design.

## Dashboard 1 — Workforce Overview
KPI tiles: latest snapshot headcount, hires in selected period, exits in selected period, attrition rate, average engagement.
Views:
- Line: monthly headcount trend.
- Horizontal bars: headcount by department.
- Highlight table: location × job level.
- Donut/bar: employment type mix.
Filters: snapshot month, department, location, job level.

## Dashboard 2 — Attrition & Retention
Views:
- Monthly exit trend.
- Department-wise exits and regrettable exits.
- Termination reason bar chart.
- Regrettable exit share by department.
- Job level and location breakdown.
KPI: exits, regrettable exits, regrettable exit share, average tenure at exit.

## Dashboard 3 — People & Performance
Views:
- Performance rating distribution.
- Average engagement by department.
- Tenure band distribution.
- Employment type and job-level composition.
- Department-level performance vs engagement scatter plot.
Use aggregated results and avoid exposing individual employee salaries or personal records.

## Filters and actions
Add department, location, job level and employment type filters. Add dashboard actions to filter the detail views by selected department. Use clear titles and show the reporting period in the dashboard subtitle.

## Validation
- Latest monthly snapshot headcount should reconcile to active employee count as of 2025-12-31.
- Sum of department headcount should equal total headcount.
- Monthly exits should sum to the annual attrition event count.
- Department exits should reconcile to total exits.
- Average tenure should use hire date and termination date for exited employees.
- Avoid counting one employee repeatedly from monthly snapshots when calculating employee-level measures.

## Tableau Public publishing
Use synthetic data only. Save packaged workbook as `.twbx` if using local extracts. Include screenshots in the repository after building the workbook.
