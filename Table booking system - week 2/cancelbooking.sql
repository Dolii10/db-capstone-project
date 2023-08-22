CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN Bookingid INT)
BEGIN
	DECLARE confirmation VARCHAR(255);

    DELETE FROM Bookings
    WHERE BookingID = Bookingid
    LIMIT 1;

    SET confirmation = CONCAT('Booking ', Bookingid, ' cancelled');
    
    SELECT confirmation AS Confirmation;
END