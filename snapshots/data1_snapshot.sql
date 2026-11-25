{% snapshot data1_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='member_id',
      strategy='check',
      check_cols=['begin_date', 'end_date', 'gender'],
      invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ source('bronze_data', 'data1') }}

{% endsnapshot %}
