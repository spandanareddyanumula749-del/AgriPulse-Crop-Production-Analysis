USE crop_analysis;

-- =========================================
--  SQL ANALYSIS
-- =========================================

-- 1. State-wise total production
SELECT
    state_name,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_production DESC;


-- 2. Crop-wise total production
SELECT
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop
ORDER BY total_production DESC;


-- 3. Year-wise total production
SELECT
    crop_year,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop_year
ORDER BY crop_year;


-- 4. Season-wise total production
SELECT
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY season
ORDER BY total_production DESC;


-- 5. State-wise average yield
SELECT
    state_name,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name
ORDER BY average_yield DESC;


-- 6. Crop-wise average yield
SELECT
    crop,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop
ORDER BY average_yield DESC;


-- 7. State-wise cultivated area
SELECT
    state_name,
    ROUND(SUM(area), 2) AS total_area
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_area DESC;


-- 8. Crop-wise cultivated area
SELECT
    crop,
    ROUND(SUM(area), 2) AS total_area
FROM crop_production_clean
GROUP BY crop
ORDER BY total_area DESC;


-- 9. Top 10 crops by production
SELECT
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop
ORDER BY total_production DESC
LIMIT 10;


-- 10. Top 10 states by production
SELECT
    state_name,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_production DESC
LIMIT 10;


-- 11. Top 10 districts by production
SELECT
    district_name,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY district_name
ORDER BY total_production DESC
LIMIT 10;


-- 12. Top 10 crops by average yield
SELECT
    crop,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop
ORDER BY average_yield DESC
LIMIT 10;


-- 13. Top 10 states by average yield
SELECT
    state_name,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name
ORDER BY average_yield DESC
LIMIT 10;


-- 14. Highest production record
SELECT
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value
FROM crop_production_clean
ORDER BY production DESC
LIMIT 1;


-- 15. Highest yield record
SELECT
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value
FROM crop_production_clean
ORDER BY yield_value DESC
LIMIT 1;


-- 16. Production by state and crop
SELECT
    state_name,
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name, crop
ORDER BY total_production DESC;


-- 17. Top 10 state-crop combinations
SELECT
    state_name,
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name, crop
ORDER BY total_production DESC
LIMIT 10;


-- 18. Production by crop and season
SELECT
    crop,
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop, season
ORDER BY total_production DESC;


-- 19. Production by state and season
SELECT
    state_name,
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name, season
ORDER BY total_production DESC;


-- 20. Production by year and season
SELECT
    crop_year,
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop_year, season
ORDER BY crop_year, total_production DESC;


-- 21. Production by year and crop
SELECT
    crop_year,
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop_year, crop
ORDER BY crop_year, total_production DESC;


-- 22. Production and area by crop
SELECT
    crop,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop
ORDER BY total_production DESC;


-- 23. Production, area and yield by state
SELECT
    state_name,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_production DESC;


-- 24. Production summary by season
SELECT
    season,
    COUNT(*) AS records,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY season
ORDER BY total_production DESC;


-- 25. Production summary by year
SELECT
    crop_year,
    COUNT(*) AS records,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop_year
ORDER BY crop_year;


-- 26. Rice production by state
SELECT
    state_name,
    ROUND(SUM(production), 2) AS rice_production
FROM crop_production_clean
WHERE crop = 'Rice'
GROUP BY state_name
ORDER BY rice_production DESC;


-- 27. Wheat production by state
SELECT
    state_name,
    ROUND(SUM(production), 2) AS wheat_production
FROM crop_production_clean
WHERE crop = 'Wheat'
GROUP BY state_name
ORDER BY wheat_production DESC;


-- 28. Sugarcane production by state
SELECT
    state_name,
    ROUND(SUM(production), 2) AS sugarcane_production
FROM crop_production_clean
WHERE crop = 'Sugarcane'
GROUP BY state_name
ORDER BY sugarcane_production DESC;


-- 29. Coconut production by state
SELECT
    state_name,
    ROUND(SUM(production), 2) AS coconut_production
FROM crop_production_clean
WHERE crop = 'Coconut'
GROUP BY state_name
ORDER BY coconut_production DESC;


-- 30. Number of crops produced by each state
SELECT
    state_name,
    COUNT(DISTINCT crop) AS crop_count
FROM crop_production_clean
GROUP BY state_name
ORDER BY crop_count DESC;


-- 31. Number of districts covered by each state
SELECT
    state_name,
    COUNT(DISTINCT district_name) AS district_count
FROM crop_production_clean
GROUP BY state_name
ORDER BY district_count DESC;


-- 32. Number of records by state
SELECT
    state_name,
    COUNT(*) AS record_count
FROM crop_production_clean
GROUP BY state_name
ORDER BY record_count DESC;


-- 33. Number of records by crop
SELECT
    crop,
    COUNT(*) AS record_count
FROM crop_production_clean
GROUP BY crop
ORDER BY record_count DESC;


-- 34. Zero-production records by state
SELECT
    state_name,
    COUNT(*) AS zero_production_records
FROM crop_production_clean
WHERE production = 0
GROUP BY state_name
ORDER BY zero_production_records DESC;


-- 35. Zero-yield records by crop
SELECT
    crop,
    COUNT(*) AS zero_yield_records
FROM crop_production_clean
WHERE yield_value = 0
GROUP BY crop
ORDER BY zero_yield_records DESC;


-- 36. Overall production statistics
SELECT
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(production), 2) AS average_production,
    ROUND(AVG(yield_value), 2) AS average_yield,
    ROUND(MIN(production), 2) AS minimum_production,
    ROUND(MAX(production), 2) AS maximum_production
FROM crop_production_clean;