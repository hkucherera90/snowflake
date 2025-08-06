with

source as (

    select * from {{ source('ecom', 'raw_orders') }}

),

renamed as (

    select
        id as order_id,
        store_id as location_id,
        customer as customer_id,
        subtotal as subtotal_cents,
        tax_paid as tax_paid_cents,
        order_total as order_total_cents,
        {{cents_to_dollars('subtotal',2)}} as subtotal,
        {{cents_to_dollars('tax_paid',2)}} as tax_paid,
        {{cents_to_dollars('order_total',2)}} as order_total,
        {{date_trunc('ordered_at')}}  as ordered_at

    from source

)

select * from renamed