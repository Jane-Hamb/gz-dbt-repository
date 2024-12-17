WITH campaigns_data AS (
    SELECT *
        
    FROM {{ ref('stg_gz_raw_data__adwords') }}

    UNION ALL

    SELECT *
        
    FROM {{ ref('stg_gz_raw_data__bing') }}

    UNION ALL

    SELECT *
        
    FROM {{ ref('stg_gz_raw_data__criteo') }}

    UNION ALL

    SELECT *
        
    FROM {{ ref('stg_gz_raw_data__facebook') }}
)

SELECT * FROM campaigns_data