{% snapshot snp1 %}
    {{
        config(
            target_schema='snapshot_schema',
            target_database='snap',
            unique_key='CUSTOMER_ID',
            strategy='check',
            check_cols = ['phone'],
            invalidate_hard_deletes=True,
            snapshot_meta_column_names = {
                'dbt_valid_from' :'Effective_Date',
                'dbt_valid_to': 'End_date',
                'dbt_scd_id': 'History_Data_id',
                'dbt_updated_at': 'Last_Modified_Date'
            }
        )
    }}

    select * from {{ source('sources_file', 'customers_tab') }}
 {% endsnapshot %}