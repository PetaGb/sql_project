-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
-- dlhodobe hladisko 2006, 2012, 2018
-- kazdorocny rozdiel

SELECT 
	name,
	current_year,
	CASE 
		WHEN salary > prev_salary THEN 'Grows'
		ELSE 'Don´t grow'
	END AS status
	FROM 
		(SELECT 
			DISTINCT(t1.industry_name) AS name,
			t1.year_sum AS  current_year,
			t1.average_salary AS salary,
			t2.year_sum  AS prev_year,
			t2.average_salary AS prev_salary
		FROM t_peter_gbelec_project_SQL_primary_final t1
		JOIN t_peter_gbelec_project_SQL_primary_final t2
			ON t1.industry_name = t2.industry_name 
			AND t1.year_sum = t2.year_sum + 1
			AND t1.year_sum < 2019
		GROUP BY  t1.year_sum, t1.industry_name
		ORDER BY t1.year_sum DESC) AS abc
GROUP BY name, current_year




