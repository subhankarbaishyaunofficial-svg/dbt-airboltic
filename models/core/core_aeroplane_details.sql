{{
    config(
        materialized = 'table'
    )
}}

SELECT 
aeroplane_id,
aeroplane_model,
manufacturer,
MAX(CASE WHEN property = 'max_seats' THEN value::INT END) AS max_seats,
MAX(CASE WHEN property = 'max_weight' THEN value::INT END) AS max_weight,
MAX(CASE WHEN property = 'max_distance' THEN value::INT END) AS max_distance,
MAX(CASE WHEN property = 'engine_type' THEN value::STRING END) AS engine_type,
GETDATE() AS inserted_at
		
FROM {{ ref('src_aeroplane') }}
LEFT JOIN {{ ref('src_aeroplane_model') }} ON lower(manufacturer) = lower(flight_manufacturer) AND lower(aeroplane_model) = lower(flight_type)