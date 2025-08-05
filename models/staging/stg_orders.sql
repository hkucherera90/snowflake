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
        round(subtotal/100,2) as subtotal,
        round(tax_paid/100,2) as tax_paid,
        round(order_total/100) as order_total,
        {{ dbt.date_trunc('day','ordered_at') }} as ordered_at

    from source

)

select * from renamed