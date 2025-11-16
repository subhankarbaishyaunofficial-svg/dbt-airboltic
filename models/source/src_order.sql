{{
    config(
        materialized = 'table'
    )
}}

SELECT  	
TRIM("Order ID", '" "') AS order_id,
TRIM("Customer ID", '" "') AS customer_id,
TRIM("Trip ID", '" "') AS trip_id,
TRIM("Price (EUR)", '" "') AS price_eur,
TRIM("Seat No", '" "') AS seat_no,
Status AS status,
GETDATE() AS inserted_at
		
FROM {{ source('airboltic_gsheet', 'order') }}