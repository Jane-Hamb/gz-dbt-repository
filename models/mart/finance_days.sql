WITH finance_day AS (
    SELECT
        date_date,  
        SUM(total_revenue) AS total_revenue,  
        SUM(total_qty) AS total_qty,  
        count(DISTINCT orders_id) AS nb_transaction,
        SUM(total_margin) AS total_margin,
        SUM(operational_margin) AS operational_margin,
        SUM(total_purchase_costs) AS total_purchase_costs,
        SUM(shipping_fee) AS total_shipping_fees,
        SUM(logcost) AS total_logcosts,
        SUM(total_revenue) / count(DISTINCT orders_id) AS avg_basket

    FROM
        {{ ref('int_orders_operational') }} 
    
    GROUP BY
        date_date  
)

SELECT * FROM finance_day