with 

source as (

    select * from {{ source('gz_raw_data', 'product') }}

),

renamed as (

    select
        products_id,
        cast (purchse_price as float64) as purchase_price
        

    from source

)

select * from renamed