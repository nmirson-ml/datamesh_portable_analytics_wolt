SELECT item_category, SUM(item_count) AS total_purchases 
FROM datamart.wolt_data_model_core.fact_order_item 
GROUP BY 1