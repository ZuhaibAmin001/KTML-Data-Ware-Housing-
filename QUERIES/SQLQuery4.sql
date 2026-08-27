
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	DECLARE @batch_start_time DATETIME,@batch_end_time DATETIME;
	
	BEGIN TRY

	SET @batch_start_time = GETDATE();
	PRINT'=====================';
	PRINT'LOADING BRONZE LAYER';
	PRINT'=====================';

	SET @start_time = GETDATE();

	TRUNCATE TABLE bronze.crm_cust_info

BULK INSERT bronze.Inventory_aging
	FROM 'C:\Users\Admin\Desktop\kohat textille data_warehouse_project\dataset\Inventory_aging(3).xlsx'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	); 
		SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'SECONDS';
	PRINT '==============================='

	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info
BULK INSERT bronze.Hand_Inventory
	FROM 'C:\Users\Admin\Desktop\kohat textille data_warehouse_project\dataset\Hand_Inventory(1).xlsx'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	); 
	SET @end_time = GETDATE();
	PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'SECONDS';
	PRINT '==============================='

	SET @batch_end_time = GETDATE();
	PRINT '======OVERALL TIME===='
	PRINT '>> LOAD DURATION:' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + 'SECONDS';
	PRINT '==============================='
END TRY
BEGIN CATCH
    PRINT'========================================='
	PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER'
	PRINT'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT'========================================='

	END CATCH
END
	
