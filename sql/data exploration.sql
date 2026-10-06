USE crop_analysis;
-- =========================================
-- CROP PRODUCTION DATA EXPLORATION
-- =========================================

-- 1.Number of states
SELECT COUNT(DISTINCT state_name) AS total_states
FROM crop_production_clean;

-- 2.Number of unique districts
SELECT COUNT(DISTINCT district_name) AS total_districts
FROM crop_production_clean;

-- 3.Number of unique crops
SELECT COUNT(DISTINCT crop) AS total_crops
FROM crop_production_clean;

-- 4.Year range in the dataset
SELECT
    MIN(crop_year) AS first_year,
    MAX(crop_year) AS last_year
FROM crop_production_clean;

-- 5.Number of records by season
SELECT
    season,
    COUNT(*) AS records
FROM crop_production_clean
GROUP BY season
ORDER BY records DESC;

-- 6.Top 10 crops by total production
SELECT
    crop,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop
ORDER BY total_production DESC
LIMIT 10;

-- 7.Top 10 states by total production
SELECT
    state_name,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_production DESC
LIMIT 10;

--  8.Total production by year
SELECT
    crop_year,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop_year
ORDER BY crop_year;


-- 9. Total production by season
SELECT
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY season
ORDER BY total_production DESC;


-- 10. Average yield by crop
SELECT
    crop,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop
ORDER BY average_yield DESC
LIMIT 10;


-- 11. Top 10 districts by total production
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


-- 13. Total area cultivated by year
SELECT
    crop_year,
    ROUND(SUM(area), 2) AS total_area
FROM crop_production_clean
GROUP BY crop_year
ORDER BY crop_year;


-- 14. Total area cultivated by state
SELECT
    state_name,
    ROUND(SUM(area), 2) AS total_area
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_area DESC
LIMIT 10;


-- 15. Total production by state and season
SELECT
    state_name,
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name, season
ORDER BY total_production DESC;


-- 16. Total production by crop and season
SELECT
    crop,
    season,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop, season
ORDER BY total_production DESC;


-- 17. Production by state and year
SELECT
    state_name,
    crop_year,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY state_name, crop_year
ORDER BY state_name, crop_year;


-- 18. Production by crop and year
SELECT
    crop,
    crop_year,
    ROUND(SUM(production), 2) AS total_production
FROM crop_production_clean
GROUP BY crop, crop_year
ORDER BY crop, crop_year;


-- 19. Top 10 individual production records
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
LIMIT 10;


-- 20. Top 10 records by yield
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
LIMIT 10;


-- 21. Number of crops grown in each state
SELECT
    state_name,
    COUNT(DISTINCT crop) AS number_of_crops
FROM crop_production_clean
GROUP BY state_name
ORDER BY number_of_crops DESC;


-- 22. Number of districts in each state
SELECT
    state_name,
    COUNT(DISTINCT district_name) AS number_of_districts
FROM crop_production_clean
GROUP BY state_name
ORDER BY number_of_districts DESC;


-- 23. Number of records by year
SELECT
    crop_year,
    COUNT(*) AS records
FROM crop_production_clean
GROUP BY crop_year
ORDER BY crop_year;


-- 24. Average production per record by season
SELECT
    season,
    ROUND(AVG(production), 2) AS average_production
FROM crop_production_clean
GROUP BY season
ORDER BY average_production DESC;


-- 25. Average yield by season
SELECT
    season,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY season
ORDER BY average_yield DESC;


-- 26. State with highest average yield
SELECT
    state_name,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name
ORDER BY average_yield DESC
LIMIT 10;


-- 27. Crop with highest total cultivated area
SELECT
    crop,
    ROUND(SUM(area), 2) AS total_area
FROM crop_production_clean
GROUP BY crop
ORDER BY total_area DESC
LIMIT 10;


-- 28. Production and area by crop
SELECT
    crop,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop
ORDER BY total_production DESC
LIMIT 20;


-- 29. Production, area and yield by state
SELECT
    state_name,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name
ORDER BY total_production DESC;


-- 30. Overall dataset summary
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT state_name) AS total_states,
    COUNT(DISTINCT district_name) AS total_districts,
    COUNT(DISTINCT crop) AS total_crops,
    MIN(crop_year) AS first_year,
    MAX(crop_year) AS last_year,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean;
