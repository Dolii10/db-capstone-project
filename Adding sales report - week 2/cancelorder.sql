CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN OrderIDParam INT)
BEGIN
	DECLARE confirmation VARCHAR(255);

    DELETE FROM Orders
    WHERE OrderID = OrderIDParam
    LIMIT 1;

    SET confirmation = CONCAT('Order ', OrderIDParam, ' is cancelled');
    
    SELECT confirmation AS Confirmation;
END