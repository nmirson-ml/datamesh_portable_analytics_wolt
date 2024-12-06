SELECT 
item_category, 
order_date,
SUM(item_count) AS total_purchases -- in here I'm looking at the total number of items sold, but could look at the revenue as well
FROM datamart.wolt_data_model_core.fact_order_item 
GROUP BY 1,2
