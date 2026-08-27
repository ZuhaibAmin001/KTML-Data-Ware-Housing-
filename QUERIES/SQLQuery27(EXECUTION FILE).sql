EXEC bronze.load_bronze;
EXEC silver.load_silver;
EXEC gold.load_gold;

SELECT COUNT(*) FROM gold.hand_inventory_summary;