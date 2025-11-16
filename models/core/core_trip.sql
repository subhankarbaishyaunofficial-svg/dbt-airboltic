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
CASE WHEN TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) <= 3  THEN 'Short Haul'
     WHEN TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) > 3 AND TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) <= 7 THEN 'Medium Haul'
     WHEN TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) > 7 AND TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) <= 12 THEN 'Long Haul'
     WHEN TIMESTAMPDIFF('HOUR', to_date(depature_at), to_date(arrival_at)) > 12 THEN 'Ultra-Long Haul'
ELSE NULL END AS haul_type,
GETDATE() AS inserted_at
		
FROM {{ ref('src_trip') }}