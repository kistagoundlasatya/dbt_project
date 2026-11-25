{{
    config(
        materialized='incremental',
        unique_key ='id',
        incremental_strategy='merge'
    )
}}
select *from {{ source('sources_file', 'emp_table_data') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where UPDATED_AT > (select max(UPDATED_AT) from {{ this }}) 
{% endif %}