{{
    config(
        materialized='table',
        transient = true
    )
}}

select *from hu