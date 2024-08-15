# Brazilian E-Commerce ETL Pipeline

## Overview

This Capstone project involves building an end-to-end ETL (Extract, Transform, Load) pipeline using the Brazilian E-Commerce dataset from Kaggle. The goal is to facilitate analytical insights by leveraging PostgreSQL, Docker, Docker Compose, Apache Airflow, dbt, and Google BigQuery.

## Tools Used

- **PostgreSQL**: Relational database management system for data storage.
- **Docker & Docker Compose**: Containerization for PostgreSQL and Airflow setup.
- **Apache Airflow**: Workflow automation for managing the ETL process.
- **dbt**: Data transformation and modeling.
- **Google BigQuery**: Cloud data warehousing for scalable analytics.

## Getting Started

1. Clone the repository.
2. Set up PostgreSQL, Airflow, and BigQuery environments.
3. Execute the Airflow DAG to run the ETL process.
4. Use dbt for data transformation and modeling.
5. Analyze the data to answer the provided questions.

## Project Steps

### 1. Data Ingestion into PostgreSQL

- **Download Dataset**: Obtain the Brazilian E-Commerce dataset from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) into your local laptop.
  
- **Setup PostgreSQL**: 
  - Configure PostgreSQL using Docker and Docker Compose.
  - Create a database named `e_commerce`.

- **Create Tables/Ingest Data**: Load the data into PostgreSQL tables using an `init.sql` script  that can be found in the `infra_setup` folder during Docker setup.

### 2. Configure Apache Airflow

- **Install Airflow**: Integrate Airflow into the Docker Compose setup as a service.

- **Create DAG**: 
  - Design an Airflow Directed Acyclic Graph (DAG) for orchestrating the ETL workflow.

### 3. Load Data into BigQuery

- **Setup BigQuery**: 
  - Create a new project on Google Cloud Platform (GCP).
  - Enable the BigQuery API and set up a service account and dataset for the e_commerce data.

- **Load Data**: 
  - Use Airflow to extract data from PostgreSQL to a GCS Bucket.
  - Then Load the processed data into BigQuery using Airflow as well.

### 4. Data Transformation with dbt

- **Setting up dbt core**: 
  - Install dbt and initialize a new project.

- **Configure dbt**: 
  - Connect dbt to your BigQuery dataset.

- **Create Models**:
  - Develop dbt models to clean and structure the data for analysis.

## The Data Models are:

**Staging Models**
- `stg_orders.sql`: Stores the raw orders data
- `stg_products.sql`: Stores the raw product data.
- `stg_customers.sql`: Stores the raw customers data.
- `stg_order_items.sql`: Stores the raw order items data.

**Intermediate Models**
- `int_sales_by_category.sql`: Aggregates sales by product category.
- `int_avg_delivery_time.sql`: Computes average delivery time.
- `int_orders_by_state.sql`: Counts orders by state.

**Final Models**
- `fct_sales_by_category.sql`: Final model for sales by category.
- `fct_avg_delivery_time.sql`: Final model for average delivery time.
- `fct_orders_by_state.sql`: Final model for orders by state.

**Create a `_custom_sources.yml` file to be able to connect to the ecommerce Bigquery Dataset**

### 5. Answer Analytical Questions

Analyze the sql queries on our final models to address the following busniess logic/questions:

1. **Which product categories have the highest sales?**
   - Aggregate sales data by product category.
   (We see that the product with the highest sales is: ... with a sale price of ...)

2. **What is the average delivery time for orders?**
   - Calculate the average time between order placement and delivery.
   (We see that the average delivery time for orders is ...)

3. **Which states have the highest number of orders?**
   - Count the number of orders per state.
   (We see that the state with the highest number of orders is ...)