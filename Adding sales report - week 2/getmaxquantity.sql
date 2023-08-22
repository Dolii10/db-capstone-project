CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
	DECLARE max_quantity INT;
    SELECT MAX(Quantity) INTO max_quantity
    FROM Orders;
    
    SELECT max_quantity AS MaxQuantityInOrder;
END