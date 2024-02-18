USE LittleLemonDB;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE Menus;
TRUNCATE Bookings;
TRUNCATE Orders;

TRUNCATE Customers;
TRUNCATE Staff;
TRUNCATE Cuisines;
TRUNCATE MenuType;
TRUNCATE OrderDeliveryStatus;

SET FOREIGN_KEY_CHECKS = 1;

-- Insert data into CustomerDetails
INSERT INTO `Customers` (`CustomerID`, `CustomerName`, `CustomerContactNumber`, `CustomerEmail`)
VALUES
(1, 'John Doe', '123-456-1111', 'john.doe@example.com'),
(2, 'Jane Wiliams', '123-456-2222', 'jane.doe@example.com'),
(3, 'Alice Smith', '123-456-3333', 'alice@example.com'),
(4, 'Bob Doe', '123-456-4444', 'bob@example.com');

-- Insert data into StaffInformation
INSERT INTO `Staff` (`StaffID`, `StaffName`, `StaffRole`, `StaffSalary`)
VALUES
(1, 'Sarah', 'Manager', 55000),
(2, 'Linda', 'Chef', 40000),
(3, 'Jessica', 'Waiter', 38000),
(4, 'Brian', 'Waiter', 29000);

-- Insert data into Cuisines
INSERT INTO `Cuisines` (`CuisineID`,`CuisineName`) 
VALUES 
(1,'Greek'),
(2,'Italian'),
(3,'Turkish');

-- Insert data into MenuTypes
INSERT INTO `MenuType` (`MenuTypeID`,`MenuTypeName`) 
VALUES 
(1,'Starters'),
(2,'Courses'),
(3,'Desserts'),
(4,'Drinks');

-- Insert data into Menus
INSERT INTO `Menus` (`MenuID`, `MenuName`, `Price`, `MenuTypeID`, `CuisineID`)
VALUES
(1,'Olives', 5, 1, 1),
(2,'Flatbread', 5, 1, 3),
(3, 'Minestrone', 8, 1, 2),
(4, 'Tomato bread', 8, 1, 1),
(5, 'Falafel', 7, 1, 3),
(6, 'Hummus', 5, 1, 3),

(7, 'Greek salad', 15, 2, 1),
(8, 'Bean soup', 12, 2, 1),
(9, 'Pizza', 150, 2, 2),
(10, 'Kabasa', 17, 2, 3),

(11,'Greek yoghurt', 7, 3, 1),
(12, 'Ice cream', 6, 3, 3),
(13, 'Cheesecake', 4, 3, 2),

(14, 'Athens White wine', 250, 4, 1),
(15, 'Corfu Red Wine', 30, 4, 2),
(16, 'Turkish Coffee', 10, 4, 3);

-- Insert data into Bookings
INSERT INTO `Bookings` (`BookingID`, `BookingDate`, `TableNumber`,  `CustomerID`,  `StaffID`)
VALUES
(1, '2024-02-01', 1, 1, 3),
(2, '2024-02-01', 2, 2, 4),
(3, '2024-02-01', 3, 3, 1),
(4, '2024-02-02', 1, 2, 3),
(5, '2024-02-03', 1, 3, 4),
(6, '2024-02-03', 2, 4, 3);

-- Insert data into OrderDeliveryStatus
INSERT INTO `OrderDeliveryStatus` (`OrderDeliveryStatusID`, `OrderStatus`)
VALUES
(1, 'Preparing'),
(2, 'Delivered');

-- Insert data into Orders
INSERT INTO `Orders` (`OrderID`, `OrderDate`, `BookingID`, `MenuID`, `Quantity`, `TotalCost`, `OrderDeliveryStatusID`)
VALUES
(1, '2024-02-01', 1, 3, 3, 24, 2),
(2, '2024-02-01', 1, 9, 1, 150, 2),

(3, '2024-02-01', 2, 2, 5, 25, 2),
(4, '2024-02-01', 2, 8, 2, 24, 2),
(5, '2024-02-01', 2, 14, 2, 500, 2),

(6, '2024-02-01', 3, 9, 2, 300, 2),

(7, '2024-02-02', 4, 5, 1, 7, 2),
(8, '2024-02-02', 4, 10, 1, 17, 2),
(9, '2024-02-02', 4, 11, 1, 7, 2),

(10, '2024-02-03', 5, 4, 4, 32, 2),
(11, '2024-02-03', 5, 8, 2, 24, 2),

(12, '2024-02-03', 5, 3, 2, 16, 2),
(13, '2024-02-03', 5, 7, 2, 30, 1),
(14, '2024-02-03', 5, 16, 2, 20, 2);
