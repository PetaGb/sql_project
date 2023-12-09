-- Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období
-- v dostupných datech cen a mezd?

SELECT 
	food_name,
	year_sum,
	price,
	round(sum(average_salary)/COUNT(average_salary), 0) AS salary,
	round(sum(average_salary)/COUNT(average_salary)/price, 0) AS food_per_salary
FROM t_peter_gbelec_project_SQL_primary_final tpgpspf 
WHERE year_sum IN (2006, 2018)
	AND food_name IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
GROUP BY food_name, year_sum;