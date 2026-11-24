# Tableau Calculated Fields

Create these calculated fields in Tableau. Field names assume the CSV tables are related by Employee ID.

## Headcount (snapshot)
`COUNTD([Employee ID])`
Use the monthly snapshot table and filter the snapshot month to the latest available month for current headcount.

## Hires
`COUNTD(IF DATETRUNC('month',[Hire Date]) = DATETRUNC('month',[Selected Month]) THEN [Employee ID] END)`
For a dashboard, use a month parameter or a dedicated calendar table to control the selected month.

## Exits
`COUNTD([Employee ID])`
Use the attrition table and filter `Termination Date` to the selected reporting period.

## Average tenure (active)
`AVG(DATEDIFF('day',[Hire Date],#2025-12-31#)/365.25)`
This fixed-date example is reproducible for the supplied 2025 dataset; replace the date with a reporting-date parameter for a live dashboard.

## Regrettable exits
`SUM([Regrettable Flag])`

## Regrettable attrition share
`SUM([Regrettable Flag]) / COUNTD([Employee ID])`
Apply to the attrition data source; format as percentage.

## Average engagement
`AVG([Engagement Score])`

## Average performance rating
`AVG([Performance Rating])`

## Tenure band
```tableau
IF DATEDIFF('year',[Hire Date],#2025-12-31#) < 1 THEN "<1 year"
ELSEIF DATEDIFF('year',[Hire Date],#2025-12-31#) < 3 THEN "1–2 years"
ELSEIF DATEDIFF('year',[Hire Date],#2025-12-31#) < 5 THEN "3–4 years"
ELSE "5+ years"
END
```

**Important:** Do not join the monthly snapshot table directly to employee-level and attrition facts in a way that multiplies rows. Use separate Tableau data sources/relationships or carefully defined relationships at employee and date grain. Use the monthly snapshot for headcount trends and the attrition table for exits.
