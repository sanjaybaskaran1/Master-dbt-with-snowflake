SELECT 
       O.*,
       OM.DESCRIPTION AS ORDER_DESCRIPTION
FROM {{ source('raw', 'ORDERS') }} AS O LEFT JOIN {{ ref('orders_mapping') }} AS OM 
ON O.ORDER_STATUS = OM.ORDER_STATUS