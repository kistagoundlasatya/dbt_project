{{
    config(
        materialized='incremental'
    )
}}
select *from {{ source('sources_file', 'sales_data') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where LAST_MODIFIED_DT > (select max(LAST_MODIFIED_DT) from {{ this }}) 
{% endif %}