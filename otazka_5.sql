-- Má výška HDP vliv na změny ve mzdách a cenách potravin? 
-- Pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

WITH salary_price_comparison AS (
	SELECT
		current_year, 
		prev_year,
		round(((current_salary - prev_salary)/prev_salary) * 100, 2) AS salary_growth,
		round(((current_food_price - prev_food_price)/prev_food_price) * 100, 2) AS food_price_growth,
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
		GROUP BY t1.year_sum) AS abc)
	SELECT
		'gdp growth > 5%' AS gdp,
		round(avg(s.salary_growth), 2) AS average_salary_growth,
		round(avg(s.food_price_growth), 2) AS average_food_price_growth,
		round(avg(t.gdp_growth), 2) AS average_gdp_growth
	FROM salary_price_comparison s
	LEFT JOIN t_peter_gbelec_project_SQL_secondary_final t
		ON s.prev_year = t.YEAR
	WHERE t.gdp_growth > 5
	UNION 
	SELECT
		'gdp growth < 0%' AS gdp,
		round(avg(s.salary_growth), 2) AS average_salary_growth,
		round(avg(s.food_price_growth), 2) AS average_food_price_growth,
		round(avg(t.gdp_growth), 2) AS average_gdp_growth
	FROM salary_price_comparison s
	LEFT JOIN t_peter_gbelec_project_SQL_secondary_final t
		ON s.prev_year = t.YEAR
	WHERE t.gdp_growth < 0
	
	