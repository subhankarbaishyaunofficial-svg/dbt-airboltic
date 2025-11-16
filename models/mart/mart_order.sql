{{
    config(
        materialized = 'table'
    )
}}

SELECT  	
order_id,
customer_id,
order.trip_id,
trip.haul_type,
price_eur,
seat_no,
status,
aeroplane_model,
manufacturer,
GETDATE() AS inserted_at
		
FROM {{ ref('core_order') }} order
