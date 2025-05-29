-- Create database and switch context
CREATE DATABASE Project;
USE Project;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    registration_date DATE NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    shipping_status VARCHAR(20) NOT NULL CHECK (shipping_status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Customers
INSERT INTO Customers (customer_id, first_name, last_name, email, registration_date, city, country) VALUES
(101,'Alice','Smith','alice.smith@example.com','2023-01-10','NewYork', 'USA'),
(102,'Bob','Johnson','bob.j@example.com','2023-01-15','London','UK'),
(103,'Charlie','Brown','charlie.b@example.com','2023-01-20','Paris', 'France'),
(104,'Diana','Miller','diana.m@example.com','2023-02-01','Berlin','Germany'),
(105,'Eve','Davis','eve.d@example.com','2023-02-05','Tokyo','Japan'),
(106,'Frank','Garcia','frank.g@example.com','2023-02-10','Sydney','Australia'),
(107,'Grace','Rodriguez','grace.r@example.com','2023-02-15','NewYork', 'USA'),
(108,'Henry','Martinez','henry.m@example.com','2023-02-20','London','UK'),
(109,'Ivy','Hernandez','ivy.h@example.com','2023-03-01','Berlin', 'Germany'),
(110,'Jack','Lopez','jack.l@example.com','2023-03-05','Tokyo','Japan'),
(111,'Karen','Gonzalez','karen.g@example.com','2023-03-10','Sydney','Australia'),
(112,'Liam','Perez','liam.p@example.com','2023-03-15','NewYork','USA'),
(113,'Mia','Wilson','mia.w@example.com','2023-03-20','London','UK'),
(114,'Noah','Anderson','noah.a@example.com','2023-04-01','Paris','France'),
(115,'Olivia','Thomas','olivia.t@example.com','2023-04-05','Berlin','Germany'),
(116,'Paul','Jackson','paul.j@example.com','2023-04-10','Tokyo','Japan'),
(117,'Quinn','White','quinn.w@example.com','2023-04-15','Sydney','Australia'),
(118,'Rachel','Harris','rachel.h@example.com','2023-04-20','NewYork','USA'),
(119,'Sam','Martin','sam.m@example.com','2023-05-01','London','UK'),
(120,'Tina','Thompson','tina.t@example.com','2023-05-05','Paris','France');

-- Insert Products
INSERT INTO Products (product_id, product_name, category, price, stock_quantity) VALUES
(1,'LaptopProX1','Electronics',1200.00,50),
(2,'WirelessMouseM100','Electronics',25.00,200),
(3,'MechanicalKeyboardK900','Electronics',90.00,120),
(4,'CoffeeMakerDeluxe','HomeAppliances',80.00,75),
(5,'SmartLEDTV55"','Electronics',750.00,30),
(6,'BlenderUltraBlend','HomeAppliances',60.00,90),
(7,'ExternalSSD1TB','Electronics',150.00,80),
(8,'BluetoothSpeakerX2','Electronics',45.00,150),
(9,'RobotVacuumCleaner','HomeAppliances',250.00,40),
(10,'GamingHeadsetG500','Electronics',70.00,110),
(11,'DeskChairErgonomic','Furniture',180.00,60),
(12,'StandingDeskElectric','Furniture',350.00,35),
(13,'AirFryerSmart','HomeAppliances',120.00,55),
(14,'NoiseCancellingHeadphones','Electronics',180.00,70),
(15,'PortablePowerBank20000mAh','Electronics',35.00,250),
(16,'SmartwatchFitness','Wearables',100.00,95),
(17,'E-readerOasis','Electronics',130.00,65),
(18,'ActionCamera4K','Electronics',200.00,45),
(19,'DumbbellSet20kg','Sports&Outdoors',60.00,80),
(20,'YogaMatEco','Sports&Outdoors',20.00,130),
(21,'ElectricKettleRapid','HomeAppliances',30.00,100),
(22,'TabletProM1','Electronics',400.00,60),
(23,'SmartLightBulb','SmartHome',15.00,300),
(24,'SecurityCameraOutdoor','SmartHome',90.00,70),
(25,'TravelBackpack','Bags&Luggage',50.00,120),
(26,'KidsBicycle','Sports&Outdoors',150.00,25),
(27,'Toaster4-slice','HomeAppliances',40.00,85),
(28,'GamingMonitor27"','Electronics',300.00,40),
(29,'PortableProjector','Electronics',220.00,30),
(30,'WirelessChargerPad','Electronics',20.00,180);

-- Insert Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, shipping_status) VALUES
(1001,101,'2024-01-25',1225.00,'Delivered'),
(1002,102,'2024-01-26',80.00,'Delivered'),
(1003,103,'2024-01-28',90.00,'Shipped'),
(1004,104,'2024-02-02',750.00,'Delivered'),
(1005,105,'2024-02-06',150.00,'Pending'),
(1006,106,'2024-02-11',45.00,'Delivered'),
(1007,107,'2024-02-16',1200.00,'Delivered'),
(1008,108,'2024-02-21',60.00,'Shipped'),
(1009,109,'2024-03-02',250.00,'Delivered'),
(1010,110,'2024-03-06',70.00,'Pending');

-- Insert Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1001, 1, 1, 1200.00),
(1001, 2, 1, 25.00),
(1002, 4, 1, 80.00),
(1003, 3, 1, 90.00),
(1004, 5, 1, 750.00),
(1005, 7, 1, 150.00),
(1006, 8, 1, 45.00),
(1007, 1, 1, 1200.00),
(1008, 6, 1, 60.00),
(1009, 9, 1, 250.00),
(1010, 10, 1, 70.00);
