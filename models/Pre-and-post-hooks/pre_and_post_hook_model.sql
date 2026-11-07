{{
    config(
        materialized='table',

        pre_hook = "
                  INSERT INTO DBT_AUDIT_LOG(DBT_MODEL_NAME, RUN_STATUS, RUN_TIME)
                  VALUES('pre_and_post_hook_model', 'STARTED', CURRENT_TIMESTAMP())   
        ",

        post_hook = "
                   INSERT INTO DBT_AUDIT_LOG(DBT_MODEL_NAME, RUN_STATUS, RUN_TIME)
                  VALUES('pre_and_post_hook_model', 'COMPLETED', CURRENT_TIMESTAMP()) 
        "
    )
}}
SELECT 
      ORDER_ID,
      QUANTITY,
      UNIT_PRICE,
      {{ calculate_order_amount('QUANTITY', 'UNIT_PRICE') }} AS ORDER_AMOUNT
FROM
    {{ source('raw', 'ORDERS') }}