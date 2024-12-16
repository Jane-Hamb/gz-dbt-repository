WITH operational_data AS (
    SELECT
        iom.orders_id,
        iom.date_date,
        iom.total_revenue,
        iom.total_qty,
        iom.total_purchase_costs,
        iom.total_margin,
        s.shipping_fee,
        s.logcost,
        s.ship_cost,
        (iom.total_margin + s.shipping_fee - s.logcost - s.ship_cost) AS operational_margin  
    FROM
        {{ ref('int_orders_margin') }} AS iom  
    JOIN
        {{ ref('stg_gz_raw_data__ship') }} AS s 
    ON
        iom.orders_id = s.orders_id  
)

SELECT * FROM operational_data