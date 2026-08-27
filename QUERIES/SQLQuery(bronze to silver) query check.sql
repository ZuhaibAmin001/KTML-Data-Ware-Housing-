SELECT * FROM bronze.inventory_aging
--- to check if inventory and hand invenotry items are same
SELECT DISTINCT
b.item_number 
FROM silver.inventory_aging AS b
LEFT JOIN silver.hand_inventory AS s
ON TRIM(b.item_number) = TRIM(s.item)
WHERE s.item IS NULL

-----
SELECT
    item_number,
    product_name,
    inventory_unit,
    configuration
FROM silver.inventory_aging
WHERE item_number != TRIM(item_number)
   OR product_name != TRIM(product_name)
   OR inventory_unit != TRIM(inventory_unit)
   OR configuration != TRIM(configuration);
---------
SELECT * FROM bronze.inventory_aging
--------------
SELECT item_number
FROM bronze.inventory_aging
WHERE item_number = 203
------------
SELECT
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p1_quantity), 0) AS p1_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p2_quantity), 0) AS p2_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p3_quantity), 0) AS p3_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p4_quantity), 0) AS p4_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p5_quantity), 0) AS p5_quantity
FROM BRONZE.inventory_aging;
SELECT 
SUM(ON_HAND_QUANTITY)
FROM bronze.inventory_aging
------
SELECT * FROM silver.inventory_aging