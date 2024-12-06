SELECT 
i.item_category,
COUNT(DISTINCT p.promo_id ) as promotions
FROM datamart.wolt_data_model_core.dim_items_scd i
JOIN datamart.wolt_data_model_core.dim_promotions p 
ON i.item_key = p.item_key 
AND ((promo_start_date BETWEEN record_valid_from AND record_valid_to) OR (promo_start_date >= record_valid_from AND record_valid_to IS NULL)) --this is to account for the fact that some promotions are ongoing and that item category might change, so use the scd table. 
GROUP BY 1