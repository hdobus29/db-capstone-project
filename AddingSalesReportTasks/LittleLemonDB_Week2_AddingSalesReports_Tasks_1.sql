USE LittleLemonDB;

-- Task 1
CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;

-- Task 2
SELECT 
	c.CustomerID,
    c.CustomerName AS FullName,
    o.OrderID,
    o.TotalCost AS Cost,
    m.MenuName,
    mt.MenuTypeName as CourseName
FROM Customers c
JOIN Bookings b 
ON c.CustomerID = b.BookingID
JOIN Orders o
ON b.BookingID = o.BookingID
JOIN Menus m
ON o.MenuID = m.MenuID
JOIN MenuType mt
ON m.MenuTypeID = mt.MenuTypeID
WHERE TotalCost > 150
ORDER BY TotalCost;

-- Task 2
SELECT MenuName
FROM Menus
WHERE MenuID = ANY (
	SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);

