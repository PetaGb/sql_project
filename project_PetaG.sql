WITH large_gdp_area AS (
    SELECT *
    FROM economies
    WHERE GDP > 70000000000
)
SELECT
    ROUND( AVG(taxes), 2) AS taxes_average
FROM large_gdp_area;