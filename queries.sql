-- =====================================================
-- Energy Consumption Analysis (Snowflake)
-- Database: tableau | Schema: tableau_Data
-- =====================================================

-- 1. Explore the data
SELECT COUNT(*) FROM tableau.tableau_Data.tableau_dataset;
SELECT * FROM tableau.tableau_Data.tableau_dataset LIMIT 20;

SELECT * FROM tableau.tableau_Data.tableau_dataset;

SELECT REGION, COUNT(*)
FROM tableau.tableau_Data.tableau_dataset
GROUP BY REGION;

-- 2. Session setup
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
USE DATABASE tableau;
USE SCHEMA tableau_Data;

-- 3. Create a working copy of the dataset
CREATE OR REPLACE TABLE energy_consumption AS
SELECT * FROM tableau_dataset;

SELECT * FROM tableau_dataset;
SELECT * FROM energy_consumption;

-- 4. Data transformation
SELECT * FROM tableau.tableau_Data.tableau_dataset;

SELECT income_level, COUNT(*)
FROM tableau.tableau_Data.tableau_dataset
GROUP BY income_level;

-- Increase MONTHLY_USAGE_KWH by income level:
-- Low +10%, Middle +20%, High +30%

-- Update 1
UPDATE tableau.tableau_Data.tableau_dataset
SET MONTHLY_USAGE_KWH = MONTHLY_USAGE_KWH * 1.1
WHERE income_level = 'Low';

-- Update 2
UPDATE tableau.tableau_Data.tableau_dataset
SET MONTHLY_USAGE_KWH = MONTHLY_USAGE_KWH * 1.2
WHERE income_level = 'Middle';

-- Update 3
UPDATE tableau.tableau_Data.tableau_dataset
SET MONTHLY_USAGE_KWH = MONTHLY_USAGE_KWH * 1.3
WHERE income_level = 'High';

SELECT * FROM tableau.tableau_Data.tableau_dataset;

-- Reduce COST_SAVINGS_USD by income level
-- (as originally run: Low -10%, Middle -20%, High -10%)

UPDATE tableau.tableau_Data.tableau_dataset
SET cost_savings_usd = cost_savings_usd * 0.9
WHERE income_level = 'Low';

UPDATE tableau.tableau_Data.tableau_dataset
SET cost_savings_usd = cost_savings_usd * 0.8
WHERE income_level = 'Middle';

UPDATE tableau.tableau_Data.tableau_dataset
SET cost_savings_usd = cost_savings_usd * 0.9
WHERE income_level = 'High';
