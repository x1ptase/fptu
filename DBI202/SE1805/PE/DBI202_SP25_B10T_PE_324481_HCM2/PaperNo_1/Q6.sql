SELECT
	C.customer_id,
	C.first_name + ', ' + C.last_name AS [Fullname],
	O.order_date,
	o.order_status
FROM
	customers AS C
	JOIN orders AS O ON C.customer_id=O.customer_id
WHERE
	YEAR(O.order_date) = 2018 AND
	MONTH(O.order_date) = 2