CREATE TRIGGER trigger_AfterPriceUpdate
ON Products
AFTER UPDATE
AS
BEGIN
    INSERT INTO PriceHistory(ProductID, OldPrice, NewPrice)
    SELECT D.ProductID, D.Price, I.Price
    FROM deleted D, inserted I
    WHERE D.ProductID=I.ProductID
    				AND D.Price <> I.Price; -- Only log if the price has changed
END;

--TEST
SELECT * FROM Products
SELECT * FROM PriceHistory;
UPDATE Products SET Price=1200 WHERE ProductID=1
SELECT * FROM Products
SELECT * FROM PriceHistory;