{{
    config(
        materialized = 'table'
    )
}}

SELECT 
customer_id,
customer_name,
customer_group_id,
email,
phone_number,
contact_type,
customer_type,
corporate_name,
registry_number,
GETDATE() AS inserted_at
		
FROM {{ ref('core_customer') }}