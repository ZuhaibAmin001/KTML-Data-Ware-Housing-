
TRUNCATE TABLE silver.hand_inventory;
INSERT INTO silver.hand_inventory (
    item,
    item_name,
    configuration,
    size,
    color,
    style,
    warehouse,
    qty
)
SELECT 
    item,
    item_Name,
    CASE WHEN TRIM(Configuration) = '-' THEN 'N/A' ELSE TRIM(Configuration) END AS configuration,
    CASE WHEN TRIM(Size) = '-' THEN 'N/A' ELSE TRIM(Size) END AS size,
    CASE WHEN TRIM(color) = '-' THEN 'N/A' ELSE TRIM(color) END AS color,
    CASE WHEN TRIM(style) = '-' THEN 'N/A' ELSE TRIM(style) END AS style,
    CASE WHEN TRIM(Warehouse) = '-' THEN 'N/A' ELSE TRIM(Warehouse) END AS warehouse,
    TRY_CAST(REPLACE(REPLACE(Quantity, CHAR(13), ''), ',', '') AS DECIMAL(18,2)) AS qty
FROM bronze.Hand_Inventory
WHERE item IS NOT NULL
  AND item <> 'Total'
  AND Warehouse != 'NULL'