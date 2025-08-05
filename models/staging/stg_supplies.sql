select * 
  from {{ source('ecom', 'raw_supplies') }}