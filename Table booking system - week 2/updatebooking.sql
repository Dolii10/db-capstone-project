CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN BookingId INT, IN BookingDate DATE)
BEGIN
	DECLARE confirmation VARCHAR(255);
    
    UPDATE Bookings
    SET Date = BookingDate
    WHERE BookingID = BookingId;
    
	SET confirmation = CONCAT('Booking ', BookingId, ' updated');
    
    SELECT confirmation AS Confirmation;
    
END