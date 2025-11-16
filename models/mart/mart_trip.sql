{{
    config(
        materialized = 'table'
    )
}}

SELECT 
trip_id,
origin_city,
destination,
airplane_id,
depature_at,
arrival_at,
haul_type,
GETDATE() AS inserted_at
		
FROM {{ ref('core_trip') }}