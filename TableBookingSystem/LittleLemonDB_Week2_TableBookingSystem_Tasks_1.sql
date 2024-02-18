USE LittleLemonDB;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE Bookings;

SET FOREIGN_KEY_CHECKS = 1;

-- Task 1

-- Insert data into Bookings
INSERT INTO `Bookings` (`BookingID`, `BookingDate`, `TableNumber`,  `CustomerID`,  `StaffID`)
VALUES
(1, '2022-10-10', 5, 1, 3),
(2, '2022-11-12', 3, 3, 4),
(3, '2022-10-11', 2, 2, 1),
(4, '2022-10-13', 2, 1, 3);

SELECT BookingID, BookingDate, TableNumber, CustomerID
FROM Bookings;

-- Task 2
DELIMITER //

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

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);

-- Task 3

DELIMITER //

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

DELIMITER ;

CALL AddValidBooking('2022-12-17', 6);
CALL AddValidBooking('2022-12-17', 6);