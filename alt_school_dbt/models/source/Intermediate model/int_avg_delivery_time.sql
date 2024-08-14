with delivery_times as(
    select 
        order_id,
        customer_state,
        order_delivered_customer_date - order_purchase_timestamp as delivery_time
    from 
        {{ ref('stg_orders') }} o
    join
        {{ ref('stg_customers') }} c
    on 
        o.customer_id = c.customer_id
    where order_delivered_customer_date is not null
)
select 
    order_id,
    customer_state,
    avg(delivery_time) as avg_delivery_time
from 
    delivery_times
group by 
    order_id, customer_state