-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?


SELECT
	food_name,
	MAX(CASE WHEN year_sum = 2018 THEN price END) - MAX(CASE WHEN year_sum = 2006 THEN price END) AS price_difference
	-- POWER(MAX(cena_2018) / MAX(cena_2006), 1 / (2018 - 2006)) - 1 AS prumerne_rocni_percentualni_zmena
FROM  t_peter_gbelec_project_SQL_primary_final
GROUP BY food_name
HAVING price_difference IS NOT NULL 
ORDER BY price_difference
-- urobim 3 cases: 2006, 2018 a avg_percentual_growth
-- https://www.wikihow.com/Calculate-an-Annual-Percentage-Growth-Rate




