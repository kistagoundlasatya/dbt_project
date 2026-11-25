{{
    config(
        materialized='table',
        query_tag ='DBT_Tags',
        alias ='new_data'
    )
}}

select 1 id