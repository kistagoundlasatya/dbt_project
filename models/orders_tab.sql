{{
    config(
        materialized='incremental'
        
    ) 
}} 
select *from {{ source('sources_file', 'orders_tab') }}