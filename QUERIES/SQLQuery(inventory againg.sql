TRUNCATE TABLE silver.inventory_aging;

INSERT INTO silver.inventory_aging (
    item_number,
    product_name,
    inventory_unit,
    configuration,
    on_hand_quantity,
    p1_quantity,
    p2_quantity,
    p3_quantity,
    p4_quantity,
    p5_quantity
)
SELECT 
    item_number,
    TRIM(product_name) AS product_name,
    TRIM(inventory_unit) AS inventory_unit,
    TRIM(configuration) AS configuration,

    COALESCE(
        TRY_CONVERT(DECIMAL(18,2), on_hand_quantity),
        0
    ) AS on_hand_quantity,

    COALESCE(TRY_CONVERT(DECIMAL(18,2), p1_quantity), 0) AS p1_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p2_quantity), 0) AS p2_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p3_quantity), 0) AS p3_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p4_quantity), 0) AS p4_quantity,
    COALESCE(TRY_CONVERT(DECIMAL(18,2), p5_quantity), 0) AS p5_quantity

FROM bronze.inventory_aging
WHERE item_number IS NOT NULL;