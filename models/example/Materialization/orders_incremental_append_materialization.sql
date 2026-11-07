{{
    config(
        materialized='incremental',
        incremental_strategy = 'append',
        unique_key = 'ORDER_ID'
    )
}}

SELECT 
      ORDER_ID,
      ORDER_STATUS,
      QUANTITY
FROM 
    {{ source('raw', 'ORDERS') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where ORDER_ID >= (select max(ORDER_ID) from {{ this }}) 
{% endif %}