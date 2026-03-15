/*
=====================================================================
Description:
This stored procedure loads raw data from external CSV files into
the Bronze schema tables of the Data Warehouse using BULK INSERT.

The Bronze layer is responsible for storing source data in its
original format with minimal transformation. The data loaded here
will later be cleaned and standardized in the Silver layer and
transformed into analytical models in the Gold layer.

Source Systems:
1. CRM System
   - cust_info.csv
   - prd_info.csv
   - sales_details.csv

2. ERP System
   - CUST_AZ12.csv
   - LOC_A101.csv
   - PX_CAT_G1V2.csv

Process Flow:
1. Existing data in Bronze tables is removed using TRUNCATE TABLE.
2. CSV files are loaded using BULK INSERT.
3. Header rows are skipped using FIRSTROW = 2.
4. Data is stored exactly as received from source systems.

Tables Loaded:
- bronze.crm_cust_info
- bronze.crm_prd_info
- bronze.crm_sales_details
- bronze.erp_cust_az12
- bronze.erp_loc_a101
- bronze.erp_px_cat_g1v2

Execution:
EXEC bronze.load_bronze;

Notes:
- SQL Server service account must have access to the file path.
- CSV files must exist at the specified location.
- ROWTERMINATOR '\n' handles newline-separated records.
=====================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	TRUNCATE TABLE bronze.crm_cust_info;
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_crm\cust_info.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_crm\prd_info.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_crm\sales_details.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_erp\CUST_AZ12.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_erp\LOC_A101.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\KamalKant\Downloads\Datasets\source_erp\PX_CAT_G1V2.csv'
	WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	);

END;
GO

EXEC bronze.load_bronze;
