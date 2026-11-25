{% snapshot snp %}
    {{
        config(
            target_schema='snapshot_schema',
            target_database='snap',
            unique_key='CUSTOMER_ID',
            strategy='check',
            check_cols = ['phone'],
            invalidate_hard_deletes=False
        )
    }}

    select * from {{ source('sources_file', 'customers_tab') }}
 {% endsnapshot %}