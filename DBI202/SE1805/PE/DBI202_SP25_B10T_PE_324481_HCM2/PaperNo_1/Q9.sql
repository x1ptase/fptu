ALTER PROCEDURE prcgetCategory
    @pro_name VARCHAR(255),
    @cat_name VARCHAR(255) OUTPUT
AS
BEGIN
 
    SELECT @cat_name = C.category_name
    FROM products AS P
    JOIN categories AS C ON P.category_id = C.category_id
    WHERE P.product_name = @pro_name;
    
END;

DECLARE @cat_name VARCHAR(255);
DECLARE @pro_name VARCHAR(255) = 'Surly Straggler - 2018';
EXECUTE prcgetCategory @pro_name, @cat_name OUTPUT;
SELECT @cat_name AS category_name;