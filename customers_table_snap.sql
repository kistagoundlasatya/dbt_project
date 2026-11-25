{% snapshot customers_table_snap %}
    {{
        config(
            unique_key='CUSTOMER_ID',
            strategy='check',
            check_cols = ['phone']
        )
    }}

    select * from {{ source('sources_file', 'customers_tab') }}
 {% endsnapshot %}