INSERT INTO gold.inventory_aging_summary (
    item_number,
    product_name,
    inventory_unit,
    configuration,
    on_hand_quantity,
    p1_quantity,
    p2_quantity,
    p3_quantity,
    p4_quantity,
    p5_quantity,
    total_aged_quantity,
    aging_percentage
)
SELECT
    item_number,
    product_name,
    inventory_unit,
    configuration,

    COALESCE(on_hand_quantity, 0) AS on_hand_quantity,
    COALESCE(p1_quantity, 0) AS p1_quantity,
    COALESCE(p2_quantity, 0) AS p2_quantity,
    COALESCE(p3_quantity, 0) AS p3_quantity,
    COALESCE(p4_quantity, 0) AS p4_quantity,
    COALESCE(p5_quantity, 0) AS p5_quantity,

    -- Total aged inventory
    COALESCE(p1_quantity, 0)
    + COALESCE(p2_quantity, 0)
    + COALESCE(p3_quantity, 0)
    + COALESCE(p4_quantity, 0)
    + COALESCE(p5_quantity, 0) AS total_aged_quantity,

    -- Aging percentage
    CASE
        WHEN COALESCE(on_hand_quantity, 0) = 0 THEN 0
        ELSE
            (
                (
                    COALESCE(p1_quantity, 0)
                    + COALESCE(p2_quantity, 0)
                    + COALESCE(p3_quantity, 0)
                    + COALESCE(p4_quantity, 0)
                    + COALESCE(p5_quantity, 0)
                ) / on_hand_quantity
            ) * 100
    END AS aging_percentage

FROM silver.inventory_aging;