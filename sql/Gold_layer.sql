-- =====================================================
-- GOLD LAYER: Customer Support KPI Aggregations
-- =====================================================

-- 1. Total number of cases
CREATE OR REPLACE TABLE gold_total_cases AS
SELECT
    COUNT(DISTINCT case_id) AS total_cases
FROM silver_cases;


-- 2. Repeat Contact Rate
-- Customers who raised more than 1 case
CREATE OR REPLACE TABLE gold_repeat_rate AS
SELECT
    COUNT(DISTINCT customer_id) AS repeat_customers,
    (COUNT(DISTINCT customer_id) * 100.0 /
     (SELECT COUNT(DISTINCT customer_id) FROM silver_cases)) AS repeat_rate_percentage
FROM silver_cases
GROUP BY customer_id
HAVING COUNT(case_id) > 1;


-- 3. Average Resolution Time (Closed cases only)
CREATE OR REPLACE TABLE gold_avg_resolution_time AS
SELECT
    AVG(resolution_time_minutes) AS avg_resolution_time_minutes
FROM silver_cases
WHERE resolution_time_minutes IS NOT NULL;


-- 4. Channel-wise Case Distribution
CREATE OR REPLACE TABLE gold_channel_distribution AS
SELECT
    channel,
    COUNT(*) AS total_cases
FROM silver_cases
GROUP BY channel;


-- 5. Daily Case Trend
CREATE OR REPLACE TABLE gold_daily_case_trend AS
SELECT
    DATE(created_at) AS case_date,
    COUNT(*) AS daily_cases
FROM silver_cases
GROUP BY DATE(created_at)
ORDER BY case_date;
