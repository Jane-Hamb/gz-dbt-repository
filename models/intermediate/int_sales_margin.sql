
WITH sales_data AS (
    SELECT
        s.orders_id,
        s.products_id,
        s.date_date,
        s.revenue AS turnover,
        s.quantity AS qty,
        p.purchase_price,
        (s.quantity * p.purchase_price) AS purchase_costs,
        (s.revenue - (s.quantity * p.purchase_price)) AS margin
    FROM
        {{ ref('stg_gz_raw_data__sales') }} AS s
    JOIN
        {{ ref('stg_gz_raw_data__product') }} AS p
    ON
        s.products_id = p.products_id
)

SELECT * FROM sales_data;