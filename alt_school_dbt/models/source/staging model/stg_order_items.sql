with order_items as (
    select 
        order_id,
        product_id,
        price,
        freight_value
    from 
        {{ source('ecommerce_sources', 'olist_order_items_dataset') }}
)
select 
    *
from
    order_items