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
		
FROM {{ ref('src_order') }} order
LEFT JOIN {{ref('core_trip')}} trip ON order.trip_id = trip.trip_id
LEFT JOIN {{ref('core_aeroplane_details')}} aeroplane ON trip.aeroplane_id = aeroplane.aeroplane_id
