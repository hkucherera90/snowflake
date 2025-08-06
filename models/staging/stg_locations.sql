with

source as (

    select * from {{ source('ecom', 'raw_stores') }}

),

renamed as (

    select
        id as location_id,
        name as location_name,
        tax_rate,
        {{ date_trunc('opened_at') }} as opened_date
    from source
)

select * from renamed
