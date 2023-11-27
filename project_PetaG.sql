SELECT cpib.name,cp.value, cp.payroll_year
FROM czechia_payroll cp JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE value_type_code = 5958
	AND payroll_quarter = 4
	AND calculation_code = 100
	AND industry_branch_code IS NOT NULL 
ORDER BY cp.payroll_year, cp.value 


SELECT YEAR (date_to), name, round(avg(value),2 ) AS price
FROM czechia_price cp 
JOIN  czechia_price_category cpc ON cp.category_code = cpc.code 
GROUP BY YEAR (date_to)








