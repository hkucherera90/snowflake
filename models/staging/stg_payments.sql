with 

source as (
  select * from {{ source('ecom', 'raw_payments') }}
),

staged as (
  
  select
      id as payment_id,
      orderid as order_id,
      payment_method as payment_method,
      status,
  
      -- amount is stored in cents, convert it to dollars
      {{cents_to_dollars('amount',2)}}  as amount,
      created as created_at
  from source
)

select * from staged