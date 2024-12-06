WITH first_time_customers AS (
    SELECT 
        customer_id, 
        order_id,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY MIN(order_timestamp)) AS order_rank
    FROM 
        datamart.wolt_data_model_core.fact_order_item
    GROUP BY 
        customer_id, order_id
    ORDER BY 1,3
),
first_orders AS(
SELECT ft.customer_id, ft.order_id, MAX(CASE WHEN had_promotion THEN 1 ELSE 0 END) AS promotion 
FROM first_time_customers ft
JOIN datamart.wolt_data_model_core.fact_order_item o ON o.customer_id = ft.customer_id AND o.order_id = ft.order_id
WHERE order_rank = 1
GROUP BY 1,2
)

SELECT SUM(promotion) AS promos
FROM first_orders