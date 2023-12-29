-- Streamlit apps are schema-level objects in Snowflake.
-- Therefore, they are located in a schema under a database.
-- They also rely on virtual warehouses to provide the compute resource.
-- We recommend starting with X-SMALL warehouses and upgrade when needed.

-- To help your team create Streamlit apps successfully, consider running the following script.
-- Please note that this is an example setup.
-- You can modify the script to suit your needs.

-- If you want to create a new database for Streamlit Apps, run
CREATE DATABASE STREAMLIT_APPS;
-- If you want to create a specific schema under the database, run
--CREATE SCHEMA <SCHEMA_NAME>;
USE DATABASE STREAMLIT_APPS;
CREATE SCHEMA DEMO;
-- Or, you can use the PUBLIC schema that was automatically created with the database.

-- If you want all roles to create Streamlit apps in the PUBLIC schema, run
--GRANT USAGE ON DATABASE STREAMLIT_APPS TO ROLE PUBLIC;
--GRANT USAGE ON SCHEMA STREAMLIT_APPS.PUBLIC TO ROLE PUBLIC;
--GRANT CREATE STREAMLIT ON SCHEMA STREAMLIT_APPS.PUBLIC TO ROLE PUBLIC;
--GRANT CREATE STAGE ON SCHEMA STREAMLIT_APPS.PUBLIC TO ROLE PUBLIC;

CREATE ROLE STREAMLIT_USER;

GRANT USAGE ON DATABASE STREAMLIT_APPS TO ROLE STREAMLIT_USER;
GRANT USAGE ON SCHEMA STREAMLIT_APPS.DEMO TO ROLE STREAMLIT_USER;
GRANT CREATE STREAMLIT ON SCHEMA STREAMLIT_APPS.DEMO TO ROLE STREAMLIT_USER;
GRANT CREATE STAGE ON SCHEMA STREAMLIT_APPS.DEMO TO ROLE STREAMLIT_USER;

-- Don't forget to grant USAGE on a warehouse.
--GRANT USAGE ON WAREHOUSE <WAREHOUSE_NAME> TO ROLE PUBLIC;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE STREAMLIT_USER;

-- If you only want certain roles to create Streamlit apps,
-- or want to enable a different location to store the Streamlit apps,
-- change the database, schema, and role names in the above commands.

-- Tables
USE SCHEMA DEMO;

CREATE or replace TABLE fcst_rates (
  fcst_period number, --Default precision and scale are (38,0)
  fcst_rate number(38, 10)
);

insert into fcst_rates (fcst_period, fcst_rate) values (1, 5.1);
insert into fcst_rates (fcst_period, fcst_rate) values (2, 5.0);
insert into fcst_rates (fcst_period, fcst_rate) values (3, 4.9);
insert into fcst_rates (fcst_period, fcst_rate) values (4, 4.8);
insert into fcst_rates (fcst_period, fcst_rate) values (5, 4.7);
insert into fcst_rates (fcst_period, fcst_rate) values (6, 4.6);
insert into fcst_rates (fcst_period, fcst_rate) values (7, 4.5);
insert into fcst_rates (fcst_period, fcst_rate) values (8, 4.4);
insert into fcst_rates (fcst_period, fcst_rate) values (9, 4.3);
insert into fcst_rates (fcst_period, fcst_rate) values (10, 4.2);
insert into fcst_rates (fcst_period, fcst_rate) values (11, 4.1);
insert into fcst_rates (fcst_period, fcst_rate) values (12, 4.0);
