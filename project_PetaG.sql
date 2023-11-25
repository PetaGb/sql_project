SELECT
    cp.category_code, cpc.name,
    cp.region_code, CONCAT(YEAR(cp.date_from), '/', MONTH(cp.date_from)) AS year_and_month,
    REPLACE(CONCAT(cp.value, ' Kč / ', cpc.price_value, ' ', cpc.price_unit), '.', ',') AS price,
    RANK() OVER (PARTITION BY cp.category_code ORDER BY cp.value DESC) AS value_rank
FROM czechia_price cp
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
ORDER BY value_rank, cp.value DESC;

