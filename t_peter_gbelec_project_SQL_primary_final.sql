CREATE OR REPLACE TABLE t_peter_gbelec_project_SQL_primary_final(
WITH czechia_payroll_by_year  AS(
SELECT cpib.name,
	   round(avg(cp.value), 0) AS salary,
	   cp.payroll_year
FROM czechia_payroll cp JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE value_type_code = 5958
	AND calculation_code = 100
	AND industry_branch_code IS NOT NULL 
GROUP BY cpib.name, cp.payroll_year),
czechia_price_by_year AS (
SELECT YEAR(date_to) AS YEAR,
	   name, 
	   round(avg(value), 2) AS price
FROM czechia_price cp 
	JOIN  czechia_price_category cpc ON cp.category_code = cpc.code 
GROUP BY name, YEAR(date_to))
SELECT a.payroll_year AS year_sum,
	   a.name AS industry_name,
	   a.salary AS average_salary,
	   b.name AS food_name, 
	   b.price
FROM  czechia_payroll_by_year a LEFT JOIN czechia_price_by_year b 
	ON a.payroll_year = b.YEAR
WHERE b.name IS NOT NULL
GROUP BY a.payroll_year, industry_name, food_name);