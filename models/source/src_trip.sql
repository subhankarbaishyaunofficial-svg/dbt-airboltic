{{
    config(
        materialized = 'table'
    )
}}

SELECT 
TRIM("Trip ID", '" "') AS trip_id,
TRIM("Origin City", '" "') AS origin_city,
TRIM("Destination City", '" "') AS destination,
TRIM("Airplane ID", '" "') AS airplane_id,
TRIM("Start Timestamp", '" "') AS depature_at, -- Assuming the depature_at is adjusted to UTC hrs
TRIM("End Timestamp", '" "') AS arrival_at, -- Assuming the arrival_at is adjusted to UTC hrs
GETDATE() AS inserted_at
		
FROM {{ source('airboltic_gsheet', 'trip') }}
