WITH finance_data AS (
    SELECT 
        date_date,
        SUM(total_revenue) AS total_revenue,
        SUM(total_qty) AS total_qty,
        SUM(nb_transaction) AS nb_transaction,
        SUM(total_margin) AS total_margin,
        SUM(operational_margin) AS operational_margin,
        SUM(total_purchase_costs) AS total_purchase_costs,
        SUM(total_shipping_fees) AS total_shipping_fees,
        SUM(total_logcosts) AS total_logcosts,
        
        SUM(avg_basket) AS avg_basket

    FROM 
        {{ ref('finance_days') }} 
    GROUP BY 
        date_date
),

campaign_data AS (
    SELECT 
        date_date,
        SUM(ads_cost) AS ads_cost,
        SUM(ads_impressions) AS ads_impressions,
        SUM(ads_clicks) AS ads_clicks
    FROM 
        {{ ref('int_campaigns_day') }}  
    GROUP BY 
        date_date
)

SELECT 
    f.date_date,
    f.total_revenue,
    f.total_qty,
    f.nb_transaction,
    f.total_margin,
    f.operational_margin,
    f.total_purchase_costs,
    f.total_shipping_fees,
    f.total_logcosts,
    f.avg_basket,
    c.ads_cost,
    c.ads_impressions,
    c.ads_clicks,
    f.operational_margin - c.ads_cost AS ads_margin
    
FROM 
    finance_data f
LEFT JOIN 
    campaign_data c
ON 
    f.date_date = c.date_date