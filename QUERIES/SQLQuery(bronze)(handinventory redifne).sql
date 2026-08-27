
EXEC sp_rename 'bronze.Hand_Inventory.Qty','','COLUMN';

TRUNCATE TABLE bronze.Hand_Inventory

SELECT * FROM bronze.Hand_Inventory
SELECT * FROM bronze.inventory_aging

Select 
item,
COUNT(*)
FROM bronze.Hand_Inventory
GROUP BY item
HAVING COUNT(*) > 1 OR COUNT(*) < 1
---------------------
SELECT 
REPLACE(color,'-','N/A') AS color
from bronze.Hand_Inventory
------------------------------------
SELECT
   CASE 
        WHEN TRIM(color) = '-' THEN 'N/A'
        ELSE color
    END AS color
FROM bronze.Hand_Inventory;
----------------------------
SELECT
color
from bronze.Hand_Inventory
where color != TRIM(color)
--------------------------
SELECT color
FROM (
    SELECT 
        CASE 
            WHEN TRIM(color) = '-' THEN 'N/A'
            ELSE TRIM(color)
        END AS color
    FROM bronze.Hand_Inventory
) t
WHERE color != TRIM(color);


-----------------------
SELECT size
FROM (
    SELECT 
        CASE 
            WHEN TRIM(Size) = '-' THEN 'N/A'
            ELSE TRIM(Size)
        END AS size
    FROM bronze.Hand_Inventory
) t
WHERE size != TRIM(size);
-------------------------
SELECT COUNT(*) AS null_count
FROM bronze.Hand_Inventory
WHERE item IS NOT NULL;

SELECT *
FROM bronze.Hand_Inventory
WHERE item IS NULL;

SELECT *
FROM bronze.Hand_Inventory
WHERE Item_Name IS NULL

SELECT *
from bronze.Hand_Inventory


SELECT * FROM bronze.Hand_Inventory





