SELECT e.country, e.year, e2.year + 1 as year_prev, 
    round( ( e.GDP - e2.GDP ) / e2.GDP * 100, 2 ) as GDP_growth,
    round( ( e.population - e2.population ) / e2.population * 100, 2) as pop_growth_percent
FROM economies e 
JOIN economies e2 
    ON e.country = e2.country 
    AND e.year = e2.year + 1
    AND e.YEAR < 2020