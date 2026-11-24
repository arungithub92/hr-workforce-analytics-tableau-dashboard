# Excel Analysis & Reconciliation Exercises

Import the CSV files into separate Excel sheets: Employees, Headcount_Monthly, Attrition.

## Exercises
1. Create a PivotTable showing employee count by department and location.
2. Create a PivotTable showing monthly headcount using Snapshot_Month.
3. Create a PivotTable showing exits by department and termination reason.
4. Use `COUNTIFS` to count employees by department and employment type.
5. Use `XLOOKUP` to retrieve department and job level from Employee ID.
6. Calculate tenure in years using `=(AsOfDate-HireDate)/365.25`.
7. Calculate annual attrition rate using exits divided by average opening/closing headcount.
8. Create a clustered bar chart for exits by department.
9. Reconcile total exits in the Attrition sheet with the monthly exit PivotTable.
10. Add slicers for department, location and job level.

## Example formulas
- Department headcount: `=COUNTIF(Employees[department],A2)`
- Full-time employees in a department: `=COUNTIFS(Employees[department],A2,Employees[employment_type],"Full-time")`
- Department lookup: `=XLOOKUP(A2,Employees[employee_id],Employees[department],"Not found")`
- Tenure years: `=ROUND((DATE(2025,12,31)-[@hire_date])/365.25,1)`

## Reconciliation controls
Check duplicate Employee IDs in Employees, duplicate employee-month combinations in Headcount_Monthly, unmatched attrition Employee IDs, and that department totals add to the overall total.
