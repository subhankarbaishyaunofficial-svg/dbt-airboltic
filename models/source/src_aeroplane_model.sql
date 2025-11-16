WITH src AS (
SELECT json_data AS data
FROM {{ source('airboltic', 'aeroplane_model') }}
),
companies AS (
SELECT
f.key::string AS flight_manufacturer,
f.value AS company_obj
FROM src,
LATERAL FLATTEN(input => data) f
),
flight_types AS (
SELECT
flight_manufacturer,
f.key::string AS flight_type,
f.value AS flight_obj
FROM companies,
LATERAL FLATTEN(input => company_obj) f
),
properties AS (
SELECT
flight_manufacturer,
flight_type,
f.key::string AS property,
f.value AS value
FROM flight_types,
LATERAL FLATTEN(input => flight_obj) f
)

SELECT flight_manufacturer, flight_type, property, value
FROM properties


