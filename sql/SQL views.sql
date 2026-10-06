USE crop_analysis;
-- =========================================================
--  SQL VIEWS
-- =========================================================

-- 1. State-wise production summary

CREATE VIEW state_production_view AS
SELECT
    state_name,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name;

SELECT *
FROM state_production_view
ORDER BY total_production DESC;

-- 2. Crop-wise production summary

CREATE VIEW crop_production_view AS
SELECT
    crop,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop;

SELECT *
FROM crop_production_view
ORDER BY total_production DESC;

-- 3. Year-wise production summary

CREATE VIEW yearly_production_view AS
SELECT
    crop_year,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY crop_year;

SELECT *
FROM yearly_production_view
ORDER BY crop_year;

-- 4. Season-wise production summary

CREATE VIEW season_production_view AS
SELECT
    season,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY season;

SELECT *
FROM season_production_view
ORDER BY total_production DESC;

-- 5. State and crop production summary

CREATE VIEW state_crop_production_view AS
SELECT
    state_name,
    crop,
    ROUND(SUM(area), 2) AS total_area,
    ROUND(SUM(production), 2) AS total_production,
    ROUND(AVG(yield_value), 2) AS average_yield
FROM crop_production_clean
GROUP BY state_name, crop;

SELECT *
FROM state_crop_production_view
ORDER BY total_production DESC
LIMIT 20;