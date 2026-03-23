/*
Script: silver_tables
Description: Creates cleaned and structured tables for the Silver layer.
Author: Kamal Kant
*/

--Create tables under schema 'silver' for Customer Info
CREATE TABLE silver.crm_cust_info(
cst_id				      INT,
cst_key				      VARCHAR(120),
cst_firstname		    VARCHAR(120),
cst_lastname		    VARCHAR(120),
cst_marital_status	VARCHAR(20),
cst_gndr			      VARCHAR(10),
cst_create_date		  DATE,
);
GO

--Create tables under schema 'silver' for Product Info
IF OBJECT_ID ('silver.crm_prd_info','U') IS NOT NULL
	DROP TABLE silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info(
prd_id			      INT,
cat_id			      VARCHAR(120),
prd_key			      VARCHAR(255),
prd_nm			      VARCHAR(120),
prd_cost		      INT,
prd_line		      VARCHAR(120),
prd_start_dt	    DATE,
prd_end_dt		    DATE,
dwh_create_date	  DATETIME2 DEFAULT GETDATE()
);
GO

--Create tables under schema 'silver' for Sales Info
IF OBJECT_ID ('silver.crm_sales_details','U') IS NOT NULL
	DROP TABLE silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details(
sls_ord_num		    VARCHAR(120),
sls_prd_key		    VARCHAR(120),
sls_cust_id		    INT,
sls_order_dt	    DATE,
sls_ship_dt		    DATE,
sls_due_dt		    DATE,
sls_sales		      INT,
sls_quantity	    INT,
sls_price		      INT,
dwh_create_date	  DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE silver.erp_cust_az12(
cid		  VARCHAR(120),
bdate	  DATE,
gen		  VARCHAR(20)
);
GO

CREATE TABLE silver.erp_loc_a101(
cid		  VARCHAR(120),
cntry	  VARCHAR(120)
);
GO

CREATE TABLE silver.erp_px_cat_g1v2(
id			      VARCHAR(100),
cat			      VARCHAR(120),
subcat		    VARCHAR(120),
maintenance   VARCHAR(20)
);
