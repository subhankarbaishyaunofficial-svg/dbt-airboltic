{{
    config(
        materialized = 'table'
    )
}}

SELECT 
TRIM("Airplane ID", '" "') AS aeroplane_id,
TRIM("Airplane Model", '" "') AS aeroplane_model,
TRIM("Manufacturer", '" "') AS manufacturer,
GETDATE() AS inserted_at
		
FROM {{ source('airboltic_gsheet', 'aeroplane') }}
