with orders as (
    select * from altschool-project-430822.ecommerce.olist_orders_dataset
),
order_items as (
    select * from altschool-project-430822.ecommerce.olist_order_items_dataset
),
order_payments as (
    select * from altschool-project-430822.ecommerce.olist_order_payments_dataset
),
customer_orders as (
    select * from altschool-project-430822.ecommerce.olist_customers_dataset
),
raw_orders as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date,
        oi.product_id,
        oi.price,
        oi.freight_value,
        op.payment_type,
        op.payment_value,
        co.customer_city,
        co.customer_state
    from orders o
    left join order_items oi on o.order_id = oi.order_id
    left join order_payments op on o.order_id = op.order_id
    left join customer_orders co on o.customer_id = co.customer_id 
)

select * from raw_orders
