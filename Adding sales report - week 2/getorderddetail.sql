CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrderDetail`(IN BookingID INT)
BEGIN
	SET @query = CONCAT(
		'SELECT OrderID, Quantity, TotalCost ',
        'FROM Orders ',
        'WHERE BookingID = ?'
	);
    
    PREPARE stmt FROM @query;
    SET @booking_id = BookingID;
    EXECUTE stmt USING @booking_id;
    DEALLOCATE PREPARE stmt;
END