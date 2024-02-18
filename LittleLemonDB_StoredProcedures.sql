USE LittleLemonDB;

DELIMITER //

-- GetMaxQuatity Stored Procedure
DROP PROCEDURE IF EXISTS GetMaxQuantity //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity)  as Max_Quantity_in_order
    FROM Orders;
END //

SELECT("GetMaxQuatity() Stored Procedure Created") AS Output//

-- Manage Booking Stored Procedures
DROP PROCEDURE IF EXISTS ManageBooking //
CREATE PROCEDURE ManageBooking()
BEGIN
	Select * FROM Bookings;
END //

SELECT("ManageBooking() Stored Procedure Created") AS Output//

DROP PROCEDURE IF EXISTS CheckBooking //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_no INT)
BEGIN
	DECLARE booking_id INT;
    
    SELECT BookingID INTO booking_id 
    FROM Bookings 
    WHERE BookingDate = booking_date and TableNumber = table_no;
    
    IF booking_id IS NOT NULL THEN
		SELECT CONCAT('Table ', table_no, ' is already booked') AS Booking_Status;
	ELSE
		SELECT CONCAT('Table ', table_no, ' is available') AS Booking_Status;
    END IF;
END //

SELECT("CheckBooking() Stored Procedure Created")  AS Output //

DROP PROCEDURE IF EXISTS AddValidBooking //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_no INT)
BEGIN
	DECLARE booking_id INT;
        
    SELECT BookingID INTO booking_id 
    FROM Bookings 
    WHERE BookingDate = booking_date and TableNumber = table_no;
    
	START TRANSACTION;
    
    -- Insert data into Bookings
	INSERT INTO `Bookings` (`BookingDate`, `TableNumber`,  `CustomerID`,  `StaffID`)
	VALUES
	(booking_date, table_no, 4, 3);
    
    IF booking_id IS NULL THEN
		COMMIT;
        SELECT CONCAT('Table ', table_no, ' is available - booking successful') AS Booking_Status;
	ELSE
		ROLLBACK;
        SELECT CONCAT('Table ', table_no, ' is already booked - booking cancelled') AS Booking_Status;
    END IF;
END //

SELECT("AddValidBooking() Stored Procedure Created")  AS Output //

DROP PROCEDURE IF EXISTS AddBooking //
CREATE PROCEDURE AddBooking(
	IN booking_id INT, 
    IN customer_id INT, 
    IN table_no INT, 
    IN booking_date DATE
)
BEGIN
	DECLARE errmsg INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
		ROLLBACK;
    END;

    START TRANSACTION;
    -- Insert data into Bookings
	INSERT INTO `Bookings` (`BookingID`, `BookingDate`, `TableNumber`,  `CustomerID`,  `StaffID`)
	VALUES
	(booking_id, booking_date, table_no, customer_id, 3);
    
    SELECT ('New booking added') AS Confirmation;
    
    COMMIT;
END //

SELECT("AddBooking() Stored Procedure Created")  AS Output //

DROP PROCEDURE IF EXISTS UpdateBooking //
CREATE PROCEDURE UpdateBooking(
	IN booking_id INT, 
    IN booking_date DATE
)
BEGIN
	DECLARE errmsg INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
		ROLLBACK;
    END;

    START TRANSACTION;
    -- Insert data into Bookings
	UPDATE Bookings
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;
    
    SELECT CONCAT('Booking ', booking_id, ' updated') AS Confirmation;
    
    COMMIT;
END //

SELECT("UpdateBooking() Stored Procedure Created")  AS Output //

DROP PROCEDURE IF EXISTS CancelBooking //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DECLARE errmsg INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
		ROLLBACK;
    END;

    START TRANSACTION;
    -- Insert data into Bookings
	DELETE FROM Bookings
    WHERE BookingID = booking_id;
    
    SELECT CONCAT('Booking ', booking_id, ' cancelled') AS Confirmation;
    
    COMMIT;
END //

SELECT("CancelBooking() Stored Procedure Created") AS Output //

DELIMITER ;
