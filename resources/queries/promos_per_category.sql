SELECT 
item_category, COUNT(DISTINCT promo_id) AS promotions
FROM datamart.wolt_data_model_core.dim_promotions promo
JOIN datamart.wolt_data_model_core.dim_items item ON item.item_key = promo.item_key
GROUP BY 1