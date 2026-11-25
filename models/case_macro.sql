{{
    config(
        materialized='table',
        transient = false,
        alias = 'case_fun',
        query_tag = 'dbt_queries'
    )
}}
select gender, {{case_macro('gender')}} gen, {{initcap_macro('fname','mname','lname')}} full_name from {{ source('src_data', 'emp_table') }}