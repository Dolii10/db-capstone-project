CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN Bookingid INT, IN BookingDate DATE, IN NumberTable INT, IN Customerid INT)
BEGIN
	DECLARE confirmation VARCHAR(255);
	INSERT INTO Bookings(BookingID, Date, TableNumber, CustomerID)
    VALUES (Bookingid, BookingDate, NumberTable, Customerid);
	SET confirmation = "New booking added";
    
	SELECT confirmation AS Confirmation;
END