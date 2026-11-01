SELECT 
      ORDER_ID,
      ORDER_STATUS,
      QUANTITY
FROM 
    {{ source('raw', 'ORDERS') }}
WHERE
     ORDER_STATUS IS NOT NULL