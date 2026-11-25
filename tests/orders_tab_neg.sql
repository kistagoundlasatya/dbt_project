{{
    config(
        store_failures = true
    )
}}
select *from {{ ref('orders_tab') }} where REVENUE < 0