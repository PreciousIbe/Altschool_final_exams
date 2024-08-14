with customer_orders as (
    select 
        customer_id,
        customer_city,
        customer_state
    from 
        {{ source('ecommerce_sources', 'olist_customers_dataset') }}
)
select 
    * 
from 
    customer_orders