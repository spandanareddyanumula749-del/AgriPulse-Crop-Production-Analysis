USE crop_analysis;

-- =========================================================
-- TAB 5: DASHBOARD QUERIES
-- =========================================================


-- 1. KPI: Overall project summary

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


-- 2. State production for dashboard

SELECT *
FROM state_production_view
ORDER BY total_production DESC;


-- 3. Crop production for dashboard

SELECT *
FROM crop_production_view
ORDER BY total_production DESC;


-- 4. Yearly production trend

SELECT *
FROM yearly_production_view
ORDER BY crop_year;


-- 5. Season production

SELECT *
FROM season_production_view
ORDER BY total_production DESC;


-- 6. Top 10 crops

SELECT
    crop,
    total_production
FROM crop_production_view
ORDER BY total_production DESC
LIMIT 10;


-- 7. Top 10 states

SELECT
    state_name,
    total_production
FROM state_production_view
ORDER BY total_production DESC
LIMIT 10;


-- 8. Top 10 state-crop combinations

SELECT
    state_name,
    crop,
    total_production,
    average_yield
FROM state_crop_production_view
ORDER BY total_production DESC
LIMIT 10;


-- 9. Yearly area and production

SELECT
    crop_year,
    total_area,
    total_production,
    average_yield
FROM yearly_production_view
ORDER BY crop_year;


-- 10. Crop performance

SELECT
    crop,
    total_area,
    total_production,
    average_yield
FROM crop_production_view
ORDER BY total_production DESC;