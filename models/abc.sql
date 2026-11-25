{{
    config(
        schema ='Computer'
    )
}}
select *from {{ source('snowflake_data', 'orders_data') }}