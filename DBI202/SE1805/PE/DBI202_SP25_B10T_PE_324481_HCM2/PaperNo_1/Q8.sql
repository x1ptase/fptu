CREATE TRIGGER trgUpdateRequiredDate
ON Orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(required_date)
    BEGIN
        IF EXISTS (
            SELECT 1 
            FROM inserted i
            JOIN deleted d ON i.order_id = d.order_id
            WHERE i.required_date < d.order_date
        )
        BEGIN
            RAISERROR ('Error: required_date cannot be earlier than order_date.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;


UPDATE Orders
SET required_date = '2016-01-06' 
WHERE order_id = 9;


SELECT * FROM orders WHERE order_id = 9