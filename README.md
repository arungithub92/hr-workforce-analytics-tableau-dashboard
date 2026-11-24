# HR Workforce Analytics Dashboard (Tableau)

A portfolio project demonstrating workforce reporting, headcount trends, employee demographics, attrition analysis, tenure, performance and engagement using **Tableau, SQL and Excel**.

> All employee records are synthetic and generated for learning. They do not represent any real employer or individual. Salary values are illustrative INR amounts.

## Business scenario
HR leadership needs a consistent view of workforce composition, hiring/exit patterns, employee tenure, performance and engagement. The analyst prepares recurring reporting, validates figures, and helps stakeholders interpret workforce KPIs.

## Business questions
1. What is the current workforce headcount by department, location and job level?
2. How has headcount changed month over month?
3. What is the annual attrition rate and how does it vary by department?
4. What are the main employee exit reasons?
5. What is the average tenure of active and exited employees?
6. How do performance ratings and engagement scores vary across teams?
7. What is the workforce mix by employment type and job level?
8. Which departments show comparatively high regrettable attrition?

## Repository
- `data/`: employee master, monthly headcount snapshots and attrition events
- `sql/`: MySQL schema and HR reporting queries
- `tableau/`: calculated fields and dashboard build guide
- `excel/`: PivotTable, formula and reconciliation exercises
- `src/`: synthetic dataset generator
- `docs/`: data dictionary, KPI definitions and assumptions
- `reports/`: generated dataset summary

## Dataset
- 1,200 synthetic employee records.
- Monthly headcount snapshots for 2025.
- Attrition events for a subset of employees.
- Department, location, job level, employment type, hire date, salary, performance rating and engagement score.

## Important KPI definitions
- **Headcount:** distinct employees active as of the selected snapshot date.
- **Attrition rate:** exits during period / average headcount during period. For a simple monthly estimate, average headcount = (opening headcount + closing headcount) / 2.
- **Regrettable attrition:** exits flagged with `regrettable_flag = 1`; this flag is synthetic.
- **Average tenure:** average completed years between hire date and snapshot/termination date, calculated separately for active and exited employees.
- **Salary:** synthetic annual salary in INR; use only for aggregated reporting and do not expose employee-level salary in public screenshots.

## Tableau dashboards
### 1. Workforce Overview
KPI tiles: headcount, hires, exits, attrition rate, average tenure, average engagement.
Charts: headcount by department, location heatmap, employment type mix, monthly headcount trend.
### 2. Attrition & Retention
Monthly exits, attrition by department, termination reasons, regrettable attrition, job-level analysis.
### 3. People & Performance
Performance rating distribution, engagement by department, tenure bands, workforce mix by job level and employment type.

## Getting started
1. Create a MySQL database using `sql/01_create_schema.sql`.
2. Import the three CSV datasets into their matching tables.
3. Run `sql/02_hr_reporting_queries.sql` and validate totals.
4. Connect Tableau Desktop/Public to MySQL or use the CSV files.
5. Follow `tableau/dashboard_build_guide.md` and create calculated fields from `tableau/calculated_fields.md`.
6. Complete the Excel exercises in `excel/excel_analysis_guide.md`.

## Privacy and responsible reporting
This is synthetic data. In real HR reporting, apply role-based access, aggregate salary and demographic outputs, suppress small groups where appropriate, and follow company privacy and retention policies. Do not infer causation from descriptive correlations.

## Interview talking points
- Difference between headcount, hires, exits and attrition rate.
- Why average headcount is used as the denominator.
- How to validate monthly snapshots against employee hire/termination dates.
- How to avoid double counting employees across monthly snapshots.
- How to present sensitive workforce data responsibly.
- How to translate an HR stakeholder question into dashboard requirements.

## Limitations
Synthetic data, one annual reporting period, generated monthly snapshots and illustrative performance/engagement values. Production extensions could add recruitment funnel, absence, learning, compensation bands, manager hierarchy and governed access controls.
