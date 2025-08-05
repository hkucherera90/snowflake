with 
customer as (
            select *
              from {{ source("ecom", "raw_customers") }}
            ),
    renamed as
            (
               select
                      id as customer_id,
                      substr(name, 1,regexp_instr(name,' ',1,1)-1) first_name,
                      substr(name, regexp_instr(name,' ',1,1)+1) last_name
                 from customer
            )
        select * from renamed