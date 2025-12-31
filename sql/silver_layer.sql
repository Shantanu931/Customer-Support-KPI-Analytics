-- =====================================================
-- Silver Layer: Clean & Enrich Customer Support Data
-- =====================================================

CREATE OR REPLACE TABLE silver_cases AS
SELECT
    case_id,
    customer_id,
    CAST(created_at AS TIMESTAMP) AS created_at,
    CAST(closed_at AS TIMESTAMP) AS closed_at,
    status,
    priority,
    channel,

    -- Resolution time in minutes
    CASE
        WHEN closed_at IS NOT NULL
        THEN TIMESTAMPDIFF(MINUTE, created_at, closed_at)
        ELSE NULL
    END AS resolution_time_minutes,

    -- Case age (for open cases)
    CASE
        WHEN status = 'open'
        THEN TIMESTAMPDIFF(MINUTE, created_at, CURRENT_TIMESTAMP)
        ELSE NULL
    END AS case_age_minutes

FROM bronze_cases
WHERE case_id IS NOT NULL;
