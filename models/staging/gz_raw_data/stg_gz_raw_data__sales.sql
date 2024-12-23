with 

source as (

    select * from {{ source('gz_raw_data', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        
        CAST(revenue AS int64) AS revenue,
        quantity

    from source

)

select * from renamed
