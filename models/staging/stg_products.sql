with

source as (

    select * from {{ source('ecom', 'raw_products') }}
),

renamed as (
    select
        sku as product_id,
        initcap(replace(name, '”','')) as product_name,
        initcap(replace(type, '”','')) as product_type,
        initcap(replace(description, '”','')) as product_description,
        round(price/100,2) as product_price,
        coalesce(type = 'jaffle', false) as is_food_item,
        coalesce(type = 'beverage', false) as is_drink_item
    from source

)

select * from renamed