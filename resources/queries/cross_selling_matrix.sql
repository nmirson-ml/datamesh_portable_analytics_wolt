SELECT
    p1.product_name AS product_1,
    p2.product_name AS product_2,
    COUNT(DISTINCT p1.order_id) AS co_occurrence_count
FROM
    datamart.wolt_data_model_core.fact_order_item AS p1
INNER JOIN
    datamart.wolt_data_model_core.fact_order_item AS p2
ON
    p1.order_id = p2.order_id
    AND p1.product_name != p2.product_name
GROUP BY
    p1.product_name, p2.product_name