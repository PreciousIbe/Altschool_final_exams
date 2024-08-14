-- Create schema
CREATE SCHEMA IF NOT EXISTS E_COMMERCE;

-- 1st Table
create table if not exists E_COMMERCE.olist_customers_dataset
(
    customer_id varchar primary key,
    customer_unique_id varchar,
    customer_zip_code_prefix varchar,
    customer_city varchar,
    customer_state varchar(2)
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_customers_dataset
COPY E_COMMERCE.olist_customers_dataset (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM '/data/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;


-- 2nd Table
create table if not exists E_COMMERCE.olist_geolocation_dataset
(
    geolocation_zip_code_prefix varchar(10),
    geolocation_lat double precision,
    geolocation_lng double precision,
    geolocation_city text,
    geolocation_state varchar(2)
);
-- This command copies the data in the /data folder into E_COMMERCE.olist_geolocation_dataset
COPY E_COMMERCE.olist_geolocation_dataset (geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
FROM '/data/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;


-- 3rd Table
create table if not exists E_COMMERCE.olist_order_items_dataset
(
    order_id varchar,
    order_item_id integer,
    product_id varchar,
    seller_id varchar,
    shipping_limit_date timestamp,
    price numeric,
    freight_value float
);
-- This command copies the data in the /data folder into E_COMMERCE.olist_order_items_dataset
COPY E_COMMERCE.olist_order_items_dataset (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM '/data/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;


-- 4th Table
create table if not exists E_COMMERCE.olist_order_payments_dataset
(
    order_id varchar,
    payment_sequential integer,
    payment_type varchar,
    payment_installments integer,
    payment_value numeric
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_order_payments_dataset
COPY E_COMMERCE.olist_order_payments_dataset (order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM '/data/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;


-- Fifth Table
create table if not exists E_COMMERCE.olist_order_reviews_dataset
(
   review_id uuid,
   order_id varchar,
   review_score integer,
   review_comment_title text,
   review_comment_message text,
   review_creation_date timestamp,
   review_answer_timestamp timestamp
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_order_reviews_dataset
COPY E_COMMERCE.olist_order_reviews_dataset (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM '/data/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;


-- 6th Table
create table if not exists E_COMMERCE.olist_orders_dataset
(
    order_id uuid primary key,
    customer_id varchar,
    order_status varchar,
    order_purchase_timestamp timestamp,
    order_approved_at timestamp,
    order_delivered_carrier_date timestamp,
    order_delivered_customer_date timestamp,
    order_estimated_delivery_date timestamp
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_orders_dataset
COPY E_COMMERCE.olist_orders_dataset (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
FROM '/data/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;


-- 7th Table
create table if not exists E_COMMERCE.olist_products_dataset
(
    product_id uuid primary key,
    product_category_name varchar,
    product_name_lenght integer,
    product_description_lenght integer,
    product_photos_qty integer,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_products_dataset
COPY E_COMMERCE.olist_products_dataset (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM '/data/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;


-- 8th Table
create table if not exists E_COMMERCE.olist_sellers_dataset
(
  seller_id varchar primary key,
  seller_zip_code_prefix varchar,
  seller_city varchar,
  seller_state varchar(2)
);

-- This command copies the data in the /data folder into E_COMMERCE.olist_sellers_dataset
COPY E_COMMERCE.olist_sellers_dataset (seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM '/data/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;


-- 9th Table
create table if not exists E_COMMERCE.product_category_name_translation
(
    product_category_name varchar,
    product_category_name_english varchar
);

-- This command copies the data in the /data folder into E_COMMERCE.product_category_name_translation
COPY E_COMMERCE.product_category_name_translation (product_category_name, product_category_name_english)
FROM '/data/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
