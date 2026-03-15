/*
=============================================================
Project      : Modern Data Warehouse using SQL Server
Author       : Kamal Kant
Description  : This script initializes the Data Warehouse 
               environment in Microsoft SQL Server by:

               1. Dropping the existing 'DataWarehouse' 
                  database if it already exists.
               2. Creating a fresh 'DataWarehouse' database.
               3. Creating schemas based on the 
                  Medallion Architecture:
                    - bronze : Raw data ingestion layer
                    - silver : Cleaned and transformed data
                    - gold   : Business-ready analytical layer

Purpose      : This setup forms the foundation of the 
               ETL/ELT pipeline and data modeling workflow 
               for analytics and reporting.

Usage        : Run this script before executing ingestion,
               transformation, or analytical scripts in
               the warehouse project.

Database     : Microsoft SQL Server
Architecture : Medallion (Bronze → Silver → Gold)
=============================================================
*/

USE master;
GO 


-- Drop the EXISTING Tabel named as DataWarehose if it is EXISTS already.

IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse
END;
GO

--Create New DATABASE as DataWarehouse.
CREATE DATABASE DataWarehouse;
GO 

--Use Database as 'DataWarehouse'.
USE DataWarehouse
GO 

--Create New Schema as bronze.
CREATE SCHEMA bronze;
GO

--Create New Schema as silver.
CREATE SCHEMA silver;
GO

--Create New Schema as gold.
CREATE SCHEMA gold;
GO
