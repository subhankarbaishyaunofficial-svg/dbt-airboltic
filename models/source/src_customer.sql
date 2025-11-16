
{{
    config(
        materialized = 'table'
    )
}}

SELECT  
TRIM("Customer ID", '" "') AS customer_id,
Name AS name,
TRIM("Customer Group ID", '" "') AS customer_group_id,
Email AS email,
TRIM("Phone Number", '" "') AS phone_number,
GETDATE() AS inserted_at
		
FROM {{ source('airboltic_gsheet', 'customer') }}
