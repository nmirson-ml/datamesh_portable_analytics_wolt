SELECT 
record_valid_from,
i.item_category,
AVG(product_base_price) as average_price_category
FROM datamart.wolt_data_model_core.dim_items_scd i
GROUP BY 1,2
