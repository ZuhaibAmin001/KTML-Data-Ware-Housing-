If OBJECT_ID('bronze.Hand_Inventory') IS NOT NULL
	DROP TABLE bronze.Hand_Inventory;
CREATE TABLE bronze.Hand_Inventory(
Item NVARCHAR(50),
Item_Name NVARCHAR(50),
Configuration NVARCHAR(50),
Size NVARCHAR(50),
Color NVARCHAR(50),
Style NVARCHAR(50),
Warehouse NVARCHAR(50),
Qty INT
)
If OBJECT_ID('bronze.inventory_aging') IS NOT NULL
	DROP TABLE bronze.inventory_aging;

CREATE TABLE bronze.inventory_aging(
item_number        NVARCHAR(50),
product_name       NVARCHAR(100),
inventory_unit     NVARCHAR(50),
configuration      NVARCHAR(255),
on_hand_quantity   DECIMAL(18,2),
p1_quantity        DECIMAL(18,2),
p2_quantity        DECIMAL(18,2),
p3_quantity        DECIMAL(18,2),
p4_quantity        DECIMAL(18,2),
p5_quantity        DECIMAL(18,2)


)