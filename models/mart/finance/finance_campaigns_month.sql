WITH monthly_data AS (
    SELECT
        FORMAT_DATE('%Y-%m', date_date) AS datemonth,
        SUM(ads_cost) AS ads_cost,
        SUM(ads_impressions) AS ads_impression,
        SUM(ads_clicks) AS ads_clicks,
        SUM(total_qty) AS quantity,
        SUM(total_revenue) AS revenue,
        SUM(total_purchase_costs) AS purchase_cost,
        SUM(total_margin) AS margin,
        SUM(total_shipping_fees) AS shipping_fee,
        SUM(total_logcosts) AS logcost,
        SUM(operational_margin) AS operational_margin,
        SUM(operational_margin) - SUM(ads_cost) AS ads_margin,  
        SUM(avg_basket) / COUNT( date_date) AS average_basket  
    FROM 
        {{ ref('finance_campaigns_day') }}  
    GROUP BY
        datemonth
)

SELECT
    datemonth,
    ROUND(ads_margin, 2) AS ads_margin,
    ROUND(average_basket, 2) AS average_basket,
    ROUND(operational_margin, 2) AS operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost
FROM
    monthly_data
ORDER BY datemonth DESC