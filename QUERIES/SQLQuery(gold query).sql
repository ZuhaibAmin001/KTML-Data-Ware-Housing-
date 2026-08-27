SELECT COUNT(*) AS gold_count
FROM gold.inventory_aging_summary;
------ 
SELECT TOP 20
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
FROM gold.inventory_aging_summary;
-------
SELECT *
FROM gold.inventory_aging_summary
WHERE total_aged_quantity <>
      (
          p1_quantity
        + p2_quantity
        + p3_quantity
        + p4_quantity
        + p5_quantity
      );
------
SELECT *
FROM gold.inventory_aging_summary
WHERE on_hand_quantity IS NULL
   OR p1_quantity IS NULL
   OR p2_quantity IS NULL
   OR p3_quantity IS NULL
   OR p4_quantity IS NULL
   OR p5_quantity IS NULL
   OR total_aged_quantity IS NULL
   OR aging_percentage IS NULL;
----------
SELECT
    MIN(aging_percentage) AS min_aging_percentage,
    MAX(aging_percentage) AS max_aging_percentage,
    AVG(aging_percentage) AS avg_aging_percentage
FROM gold.inventory_aging_summary;
----------
SELECT *
FROM gold.inventory_aging_summary
WHERE aging_percentage > 100;
---------
SELECT
    (SELECT COUNT(*) FROM bronze.inventory_aging) AS bronze_count,
    (SELECT COUNT(*) FROM silver.inventory_aging) AS silver_count,
    (SELECT COUNT(*) FROM gold.inventory_aging_summary) AS gold_count;
