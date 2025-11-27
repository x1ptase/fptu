
select location_id, country_id, street_address, city from locations
where country_id = 'us' or country_id = 'ca'
order by location_id desc