-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

SELECT 
	current_year,
	prev_year,
	CONCAT(current_year, ' - ', current_year - 1) AS period,
	current_salary,
	prev_salary,
	current_food_price,
	prev_food_price
FROM
	(SELECT
		t1.year_sum AS  current_year,
		t2.year_sum  AS prev_year,
		round(sum(t1.average_salary)/COUNT(t1.average_salary), 0) AS current_salary,
		round(sum(t2.average_salary)/COUNT(t2.average_salary), 0) AS prev_salary,
		round(sum(t1.price)/COUNT(t1.price), 0) AS current_food_price,
		round(sum(t2.price)/COUNT(t2.price), 0) AS prev_food_price
	FROM t_peter_gbelec_project_SQL_primary_final t1
	JOIN t_peter_gbelec_project_SQL_primary_final t2
		ON t1.year_sum = t2.year_sum + 1
	GROUP BY t1.year_sum) AS abc

	
