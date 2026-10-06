CREATE DATABASE crop_analysis;
USE crop_analysis;

CREATE TABLE Crop_Production (
    State_Name VARCHAR(100),
    District_Name VARCHAR(100),
    Crop_Year INT,
    Season VARCHAR(50),
    Crop VARCHAR(100),
    Area DECIMAL(12,2),
    Production DECIMAL(15,2),
    Yield DECIMAL(12,2)
);
SHOW TABLES;
DESCRIBE crop_production;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/DELL/Desktop/crop-analysis/excel/crop_production.csv'
INTO TABLE crop_production
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(state_name, district_name, crop_year, season, crop, area, production, yield_value);

SELECT COUNT(*) AS total_rows
FROM crop_production;

SELECT
    SUM(state_name IS NULL OR state_name = '') AS missing_state,
    SUM(district_name IS NULL OR district_name = '') AS missing_district,
    SUM(crop_year IS NULL) AS missing_year,
    SUM(season IS NULL OR season = '') AS missing_season,
    SUM(crop IS NULL OR crop = '') AS missing_crop,
    SUM(area IS NULL) AS missing_area,
    SUM(production IS NULL) AS missing_production,
    SUM(yield_value IS NULL) AS missing_yield
FROM crop_production;

SELECT *
FROM crop_production
LIMIT 20;

SELECT
    MIN(area) AS min_area,
    MAX(area) AS max_area,
    MIN(production) AS min_production,
    MAX(production) AS max_production,
    MIN(yield_value) AS min_yield,
    MAX(yield_value) AS max_yield
FROM crop_production;

SELECT
    COUNT(*) AS total_rows,
    SUM(area = 0) AS zero_area,
    SUM(production = 0) AS zero_production,
    SUM(yield_value = 0) AS zero_yield
FROM crop_production;

SELECT
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value,
    COUNT(*) AS duplicate_count
FROM crop_production
GROUP BY
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value
HAVING COUNT(*) > 1
LIMIT 20;

-- 1. Find the records with extremely high yield
SELECT *
FROM crop_production
WHERE yield_value >= 10000
ORDER BY yield_value DESC;

-- 2. Check how many zero values we have
SELECT
    COUNT(*) AS total_rows,
    SUM(area = 0) AS zero_area,
    SUM(production = 0) AS zero_production,
    SUM(yield_value = 0) AS zero_yield
FROM crop_production;

-- 3. Check duplicate records
SELECT
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value,
    COUNT(*) AS duplicate_count
FROM crop_production
GROUP BY
    state_name,
    district_name,
    crop_year,
    season,
    crop,
    area,
    production,
    yield_value
HAVING COUNT(*) > 1
LIMIT 20;

SELECT COUNT(*) AS unique_rows
FROM (
    SELECT DISTINCT *
    FROM crop_production
) AS unique_data;

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - (
        SELECT COUNT(*)
        FROM (
            SELECT DISTINCT *
            FROM crop_production
        ) AS unique_data
    ) AS duplicate_rows
FROM crop_production;

CREATE TABLE crop_production_backup AS
SELECT *
FROM crop_production;

SELECT COUNT(*) AS backup_rows
FROM crop_production_backup;

CREATE TABLE crop_production_clean LIKE crop_production;

INSERT INTO crop_production_clean
SELECT DISTINCT *
FROM crop_production;

SELECT COUNT(*) AS clean_rows
FROM crop_production_clean;

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(DISTINCT
        CONCAT_WS('|',
            state_name,
            district_name,
            crop_year,
            season,
            crop,
            area,
            production,
            yield_value
        )
    ) AS duplicate_rows
FROM crop_production_clean;

SELECT
    COUNT(*) AS total_rows,
    SUM(area = 0) AS zero_area,
    SUM(production = 0) AS zero_production,
    SUM(yield_value = 0) AS zero_yield
FROM crop_production_clean;

SELECT *
FROM crop_production_clean
WHERE yield_value >= 10000
ORDER BY yield_value DESC;

SELECT *
FROM crop_production_clean
WHERE production <> 0
  AND yield_value = 0;
  
  SELECT *
FROM crop_production_clean
WHERE production = 0
LIMIT 20;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        ABS(yield_value - (production / area)) > 0.01
    ) AS yield_mismatch
FROM crop_production_clean
WHERE area > 0;

SELECT
    COUNT(*) AS total_rows,
    SUM(yield_value >= 1000) AS yield_1000_plus,
    SUM(yield_value >= 5000) AS yield_5000_plus,
    SUM(yield_value >= 10000) AS yield_10000_plus
FROM crop_production_clean;
