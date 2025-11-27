SELECT
	P.product_name,
	C.category_name,
	P.list_price
FROM
	products AS P 
	INNER JOIN categories AS C ON C.category_id=P.category_id
WHERE 
	C.category_name='Mountain Bikes' AND P.list_price < 469.99