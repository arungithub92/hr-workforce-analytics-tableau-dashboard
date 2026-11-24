# KPI Definitions & Assumptions

- Headcount: distinct employee IDs in the selected monthly snapshot.
- Hires: employees with hire date inside the reporting period.
- Exits: distinct employees with termination date inside the reporting period.
- Attrition rate: period exits divided by average headcount. Average headcount = (opening + closing headcount) / 2. The SQL example uses January and December snapshot counts as the opening/closing approximation; for precise reporting, add a 2024-12-31 opening snapshot.
- Regrettable attrition: exits with regrettable_flag = 1. This label is synthetic and should be defined by HR in real reporting.
- Average tenure at exit: average days between hire date and termination date / 365.25.
- Average engagement: average engagement_score in the employee master.
- Performance: average performance_rating; ordinal ratings should be interpreted cautiously.
- Salary: synthetic annual INR amount; show aggregated values only.

The dataset is a synthetic 2025 snapshot/exit scenario. It is not suitable for real HR decisions or causal claims.
