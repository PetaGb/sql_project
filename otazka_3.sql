-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

SELECT  
	food_name,
	price_2006,
	price_2018,
	round(((POWER(price_2018/price_2006, 1/13)) - 1) * 100, 2) AS avg_percentual_growth
FROM 
	(SELECT 
		   food_name,
		   MAX(CASE WHEN year_sum = 2006 THEN price END) AS price_2006,
		   MAX(CASE WHEN year_sum = 2018 THEN price END) AS price_2018
	 FROM  t_peter_gbelec_project_SQL_primary_final
	 GROUP BY food_name
	 HAVING price_2006 IS NOT NULL) AS abc
GROUP BY food_name
ORDER BY avg_percentual_growth;






