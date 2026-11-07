{% snapshot orders_snapshot %}
    {{
        config(
            target_schema='DBT_SBASKARAN',
            target_database='DBT_SNOW_LEARN',
            unique_key='ORDER_ID',
            strategy='check',
            check_cols = ['ORDER_STATUS','UNIT_PRICE']
        )
    }}

    select 
            ORDER_ID,
            ORDER_STATUS,
            UNIT_PRICE
    from {{ source('raw', 'ORDERS') }}
 {% endsnapshot %}

