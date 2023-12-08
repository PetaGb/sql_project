CREATE OR REPLACE TABLE t_peter_gbelec_project_SQL_secondary_final(
SELECT 
    e.country,
    e.`year`,
    round(((e.GDP - e2.GDP)/ e2.GDP) * 100, 2) AS gdp_growth
FROM economies e 
JOIN economies e2 
	ON e.country = e2.country
    and e.`year` = e2.`year` + 1
WHERE e.country LIKE 'Czech%'
AND e.year  BETWEEN 2005 AND 2017
ORDER BY e.year DESC);