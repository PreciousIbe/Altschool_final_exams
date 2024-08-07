from airflow import DAG
from airflow.models import Variable
from airflow.providers.google.cloud.transfers.postgres_to_gcs import PostgresToGCSOperator
from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator
from datetime import datetime, timedelta

# Default arguments for the DAG
default_args = {
    'owner': 'precious',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 5,
    'retry_delay': timedelta(minutes=10),
}

# Define the DAG
dag = DAG(
    'postgres_to_bq',
    default_args=default_args,
    description='Transfer data from PostgreSQL to GCS and then to BigQuery',
    schedule_interval='@daily',
    start_date=datetime(2024, 8, 7),
    catchup=False,
)

# Define variables
tables = [
    'olist_customers_dataset', 'olist_geolocation_dataset', 'olist_order_items_dataset',
    'olist_order_payments_dataset', 'olist_order_reviews_dataset', 'olist_orders_dataset',
    'olist_products_dataset', 'olist_sellers_dataset', 'product_category_name_translation'
]
bucket_name = Variable.get("bucket_name")
project_id = Variable.get("project_id")
dataset_id = Variable.get("dataset")
postgres_conn_id = Variable.get("pg_conn_id")
pg_schema = Variable.get("pg_schema")
bq_conn_id = Variable.get("bq_conn_id")


# Loop through each table and create the corresponding tasks
for table in tables:
    export_to_gcs = PostgresToGCSOperator(
        task_id=f'export_{table}_to_gcs',
        postgres_conn_id=postgres_conn_id,
        sql=f'SELECT * FROM {pg_schema}.{table};',
        bucket=bucket_name,
        filename=f'{table}.json',
        export_format='newline_delimited_json',
        gzip=True,
        gcp_conn_id = bq_conn_id,
        dag=dag,
        )

    load_to_bq = GCSToBigQueryOperator(
        task_id=f'load_{table}_to_bq',
        bucket=bucket_name,
        source_objects=[f'{table}.json'],
        destination_project_dataset_table=f'{project_id}:{dataset_id}.{table}',
        source_format='newline_delimited_json',
        write_disposition='WRITE_TRUNCATE',
        autodetect=True,
        skip_leading_rows=1,
        gcp_conn_id = bq_conn_id,
        dag=dag,
    )

    export_to_gcs >> load_to_bq 