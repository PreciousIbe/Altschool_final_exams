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
  - Use Airflow to extract data from PostgreSQL.
  - Load the processed data into BigQuery.
