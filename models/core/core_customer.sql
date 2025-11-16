{{
    config(
        materialized = 'table'
    )
}}

SELECT 
id AS customer_id,
name AS customer_name,
customer_group_id,
email,
phone_number,
CASE WHEN email is not null and phone_number is not null then 'email/phone_number' 
     WHEN email is null and phone_number is null then 'Both missing'
     WHEN email is not null then 'email'
     WHEN phone_number is not null then 'phone_number'
ELSE NULL END AS contact_type,
type AS customer_type,
name AS corporate_name,
registry_number,
GETDATE() AS inserted_at
		
FROM {{ ref('src_customer') }}
LEFT JOIN {{ ref('src_customer_group') }} ON customer_group_id = id