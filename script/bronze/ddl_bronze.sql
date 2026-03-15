
/*
=====================================================================
Script Name   : bronze_layer_tables.sql
Author        : Kamal Kant
Project       : Modern Data Warehouse using SQL Server
Layer         : Bronze (Raw Data Layer)

Description   :
This script creates the required tables in the Bronze schema for
loading raw data from CRM and ERP source systems.

The Bronze layer represents the initial stage of the Medallion
Architecture where raw data is ingested exactly as received from
source systems without applying transformations.

Source Systems:
1. CRM System
   - Customer Information
   - Product Information
   - Sales Details

2. ERP System
   - Customer Demographics
   - Customer Location
   - Product Category Details

Tables Created:
CRM Tables
- bronze.crm_cust_info
- bronze.crm_prd_info
- bronze.crm_sales_details

ERP Tables
- bronze.erp_cust_az12
- bronze.erp_loc_a101
- bronze.erp_px_cat_g1v2

Notes:
- Data types closely follow the structure of the source files.
- Minimal constraints are applied since this is the raw ingestion layer.
- Data quality, cleaning, and transformations will occur in the Silver layer.

Database Platform:
Microsoft SQL Server
=====================================================================
*/

--Create tables under schema 'bronze' for Customer Info
CREATE TABLE bronze.crm_cust_info(
cst_id				INT,
cst_key				VARCHAR(120),
cst_firstname		VARCHAR(120),
cst_lastname		VARCHAR(120),
cst_marital_status	VARCHAR(20),
cst_gndr			VARCHAR(10),
cst_create_date		DATE
);
GO

--Create tables under schema 'bronze' for Product Info
CREATE TABLE bronze.crm_prd_info(
prd_id			INT,
prd_key			VARCHAR(255),
prd_nm			VARCHAR(120),
prd_cost		INT,
prd_line		VARCHAR(120),
prd_start_dt	DATE,
prd_end_dt		DATE
);
GO

--Create tables under schema 'bronze' for Sales Info
CREATE TABLE bronze.crm_sales_details(
sls_ord_num		VARCHAR(120),
sls_prd_key		VARCHAR(120),
sls_cust_id		INT,
sls_order_dt	INT,
sls_ship_dt		INT,
sls_due_dt		INT,
sls_sales		INT,
sls_quantity	INT,
sls_price		INT
);
GO

CREATE TABLE bronze.erp_cust_az12(
cid		VARCHAR(120),
bdate	DATE,
gen		VARCHAR(20)
);
GO

CREATE TABLE bronze.erp_loc_a101(
cid		VARCHAR(120),
cntry	VARCHAR(120)
);
GO

CREATE TABLE bronze.erp_px_cat_g1v2(
id			VARCHAR(100),
cat			VARCHAR(120),
subcat		VARCHAR(120),
maintenance VARCHAR(20)
);
Go
