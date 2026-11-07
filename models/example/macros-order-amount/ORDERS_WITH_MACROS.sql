SELECT 
      ORDER_ID,
      QUANTITY,
      UNIT_PRICE,
      {{ calculate_order_amount('QUANTITY', 'UNIT_PRICE') }} AS ORDER_AMOUNT
FROM
    {{ source('raw', 'ORDERS') }}