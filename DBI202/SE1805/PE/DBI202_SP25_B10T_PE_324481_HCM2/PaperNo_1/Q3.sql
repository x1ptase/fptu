SELECT
	product_id,
	product_name,
	model_year,
	list_price
FROM
	products
WHERE
	model_year=2018 AND list_price=229.99