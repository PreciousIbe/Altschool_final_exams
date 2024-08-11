with products as (
    select 
        product_id,
        product_category_name 
    from altschool-project-430822.ecommerce.olist_products_dataset
)

select * from products
