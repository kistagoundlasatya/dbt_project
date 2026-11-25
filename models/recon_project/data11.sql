{{ config(
    materialized='table'
) }}

WITH latest_records AS (
    SELECT
        member_id,
        begin_date,
        end_date,
        gender,
        dbt_valid_from,
        dbt_valid_to,
        ROW_NUMBER() OVER (
            PARTITION BY member_id
            ORDER BY dbt_valid_from DESC
        ) AS rn
    FROM {{ ref('data1_snapshot') }}
)

SELECT
    member_id,
    begin_date,
    end_date,
    gender,
    CASE
        WHEN dbt_valid_to IS NULL THEN 'Y'
        ELSE 'N'
    END AS status,
    dbt_valid_from,
    dbt_valid_to
FROM latest_records
WHERE rn = 1
