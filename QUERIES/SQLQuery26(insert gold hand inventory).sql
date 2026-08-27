INSERT INTO gold.hand_inventory_summary (
    item, item_name, configuration, size, color, style, warehouse, total_quantity
)
SELECT
    item,
    item_name,
    configuration,
    size,
    color,
    style,
    warehouse,
    SUM(qty) AS total_quantity
FROM silver.hand_inventory
GROUP BY item, item_name, configuration, size, color, style, warehouse;