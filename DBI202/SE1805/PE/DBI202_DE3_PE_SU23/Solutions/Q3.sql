SELECT location_id, country_id, street_address, postal_code, city
FROM locations
WHERE country_id='US' OR country_id='CA'
ORDER BY location_id DESC