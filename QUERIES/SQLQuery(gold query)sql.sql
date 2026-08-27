TRUNCATE TABLE gold.inventory_aging_summary;

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

    on_hand_quantity,
    p1_quantity,
    p2_quantity,
    p3_quantity,
    p4_quantity,
    p5_quantity,

    -- Total aged inventory
    p1_quantity
        + p2_quantity
        + p3_quantity
        + p4_quantity
        + p5_quantity AS total_aged_quantity,

    -- Percentage of inventory that is aged
    CASE
        WHEN on_hand_quantity = 0 THEN 0
        ELSE
            (
                (
                    p1_quantity
                    + p2_quantity
                    + p3_quantity
                    + p4_quantity
                    + p5_quantity
                ) / on_hand_quantity
            ) * 100
    END AS aging_percentage

FROM silver.inventory_aging;