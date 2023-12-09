
-- Discord nick: PeťaG (petag)

-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?


WITH industry_salary_status AS (
	SELECT 
		name,
		CONCAT(current_year, ' - ', current_year - 1) AS period,
		CASE 
			WHEN salary > prev_salary THEN 'Grows'
			ELSE 'Doesn´t grow'
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
			GROUP BY  t1.year_sum, t1.industry_name
			ORDER BY t1.year_sum DESC) AS abc
	GROUP BY name, current_year)
SELECT 
	name, 
	COUNT(CASE WHEN status = 'Doesn´t grow' THEN 1 END) AS not_growing_years
FROM industry_salary_status
GROUP BY name;




