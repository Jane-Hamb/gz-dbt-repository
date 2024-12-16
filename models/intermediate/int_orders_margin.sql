WITH sales_data AS (
    SELECT
        s.orders_id,
        s.date_date,  
        SUM(s.revenue) AS total_revenue,  
        SUM(s.quantity) AS total_qty,  
        SUM(s.quantity * p.purchase_price) AS total_purchase_costs,  
        SUM(s.revenue - (s.quantity * p.purchase_price)) AS total_margin  
    FROM
        {{ ref('stg_gz_raw_data__sales') }} AS s
    JOIN
        {{ ref('stg_gz_raw_data__product') }} AS p
    ON
        s.products_id = p.products_id
    GROUP BY
        s.orders_id,
        s.date_date  
)

SELECT * FROM sales_data