USE LittleLemonDB;

-- Task 1

DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity)  as Max_Quantity_in_order
    FROM Orders;
END //
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2
PREPARE GetOrderDetail FROM 
'SELECT o.OrderID, o.Quantity, o.TotalCost AS Cost
FROM Orders o
JOIN Bookings b
ON o.BookingID = b.BookingID
JOIN Customers c
ON b.CustomerID = c.CustomerID
WHERE c.CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3

DELIMITER //

DROP PROCEDURE IF EXISTS CancelOrder //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
	DELETE FROM Orders
    WHERE OrderID = order_id;
    
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelOrder(1);