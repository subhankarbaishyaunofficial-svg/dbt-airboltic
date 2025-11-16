{{
    config(
        materialized = 'table'
    )
}}

SELECT 
aeroplane_id,
aeroplane_model,
manufacturer,
max_seats,
max_weight,
engine_type,
GETDATE() AS inserted_at
		
FROM {{ ref('core_aeroplane_details') }}