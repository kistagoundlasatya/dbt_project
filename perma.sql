{{
    config(
        materialized='table',
        transient = false
    )
}}

select *from perma