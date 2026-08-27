CREATE OR ALTER PROCEDURE gold.load_gold AS
BEGIN
    BEGIN TRY
        PRINT '=====================';
        PRINT 'LOADING GOLD LAYER';
        PRINT '=====================';

        TRUNCATE TABLE gold.inventory_aging_summary;
        INSERT INTO gold.inventory_aging_summary (
            item_number, product_name, inventory_unit, configuration,
            on_hand_quantity, p1_quantity, p2_quantity, p3_quantity, p4_quantity, p5_quantity,
            total_aged_quantity, aging_percentage
        )
        SELECT
            item_number, product_name, inventory_unit, configuration,
            on_hand_quantity, p1_quantity, p2_quantity, p3_quantity, p4_quantity, p5_quantity,
            p1_quantity + p2_quantity + p3_quantity + p4_quantity + p5_quantity,
            CASE WHEN on_hand_quantity = 0 THEN 0
                 ELSE ((p1_quantity + p2_quantity + p3_quantity + p4_quantity + p5_quantity) / on_hand_quantity) * 100
            END
        FROM silver.inventory_aging;

        TRUNCATE TABLE gold.hand_inventory_summary;
        INSERT INTO gold.hand_inventory_summary (
            item, item_name, configuration, size, color, style, warehouse, total_quantity
        )
        SELECT
            item, item_name, configuration, size, color, style, warehouse,
            SUM(qty)
        FROM silver.hand_inventory
        GROUP BY item, item_name, configuration, size, color, style, warehouse;

        PRINT 'GOLD LAYER LOAD COMPLETE';
    END TRY
    BEGIN CATCH
        PRINT 'ERROR IN GOLD LAYER: ' + ERROR_MESSAGE();
    END CATCH
END