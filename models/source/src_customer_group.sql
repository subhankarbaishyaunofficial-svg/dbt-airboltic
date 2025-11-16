{{
    config(
        materialized = 'table'
    )
}}

SELECT 
ID AS id,
Type AS type,
Name AS name,
TRIM("Registry number", '" "') AS registry_number,
TRIM("Manufacturer", '" "') AS manufacturer,
GETDATE() AS inserted_at
		
FROM {{ source('airboltic_gsheet', 'customer_group') }}
