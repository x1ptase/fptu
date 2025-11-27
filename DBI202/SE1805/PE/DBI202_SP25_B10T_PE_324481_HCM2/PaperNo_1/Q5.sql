SELECT
	P.product_id,
	P.product_name,
	SUM(S.quantity) AS [sum_quantity]
FROM
	products AS P
	JOIN stocks AS S ON S.product_id=P.product_id
GROUP BY
	P.product_id, P.product_name
HAVING 
	SUM(S.quantity) > 75