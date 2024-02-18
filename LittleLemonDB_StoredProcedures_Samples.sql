-- GetMaxQuatity Stored Procedure
CALL GetMaxQuantity();

-- CheckBooking Stored Procedure
-- Checks if a booking spot's availability
CALL CheckBooking('2022-11-12', 3);

-- AddValidBooking Stored Procedure
CALL AddValidBooking('2022-12-17', 6);
-- Simulates try to book table that has already been booked
CALL AddValidBooking('2022-12-17', 6);

-- AddBooking Stored Procedure
-- Adds a new booking
CALL AddBooking(9, 3, 4, '2022-12-30');

-- UpdateBooking Stored Procedure
-- Updates a booking
CALL UpdateBooking(9, '2022-12-17');

-- CancelBooking Stored Procedure
-- Deletes a booking
CALL CancelBooking(9);

CALL ManageBooking();