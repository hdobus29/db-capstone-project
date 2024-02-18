USE LittleLemonDB;

DELIMITER //

-- Task 1
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

-- Task 2
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

-- Task 3
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

DELIMITER ;

-- Task 1
CALL AddBooking(9, 3, 4, '2022-12-30');

-- Task 2
CALL UpdateBooking(9, '2022-12-17');

-- Task 3
CALL CancelBooking(9);