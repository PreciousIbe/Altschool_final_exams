with products as (
    select 
        product_id,
        product_category_name as product_name
    from 
        {{ source('ecommerce_sources', 'olist_products_dataset') }}
)
select
    * 
from 
    products
