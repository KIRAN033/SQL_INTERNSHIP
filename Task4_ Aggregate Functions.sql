--CREATING Customers TABLE
CREATE TABLE Customers(
   CustomerID Int PRIMARY KEY,
   FirstName varchar(20),
   LastName varchar(20),
   Country  varchar(20),
   Score INT,
  );

--INSERTING DATA INTO Customers TABLE
   INSERT INTO Customers(CustomerID,FirstName,LastName,Country,Score)
   VALUES
   (1,'Abhaya','Das','Germany',850),
   (2,'Saloni','Yadav','USA',670),
    (3,'Akash','Behera','INDIA',1000),
	(4,'Sai','Mohanty','Germany',987),
    (5,'Likun','Samantary',null,900);

-- Create the Order table
CREATE TABLE OrderTable (
    OrderID INT,
    ProductID INT,
    CustomerID INT,
    SalesPerson INT,
    OrderDate DATE,
    ShipDate DATE,
    OrderStatus VARCHAR(20),
    ShipAddress VARCHAR(100),
    BillAddress VARCHAR(100),
    Quantity INT,
    Sales INT,
    CreationTime TIME
);

-- Insert the data
INSERT INTO OrderTable (OrderID, ProductID, CustomerID, SalesPerson, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime)
VALUES
(1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blvd.', '1226 Shoe St.', 1, 10, '00:34:56'),
(2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '00:22:04'),
(3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '00:24:08'),
(4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', NULL, 2, 60, '00:50:33'),
(5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', '1792 Belmont Rd.', NULL, 1, 25, '00:02:41'),
(6, 101, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '00:34:57'),
(7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', NULL, 2, 30, '00:22:01'),
(8, 101, 4, 2, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '00:45:22'),
(9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', NULL, 2, 20, '00:59:04'),
(10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '00:25:15');


-- BASIC AGGREGATE FUNCTIONS

-- count
SELECT COUNT(*) AS total_customers
FROM customers;

--sum
SELECT SUM(sales) AS total_sales
FROM OrderTable;

-- average(avg)
SELECT AVG(sales) AS avg_sales
FROM OrderTable;

 --  GROUPED AGGREGATIONS - GROUP BY
SELECT
    customerId,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales
FROM  OrderTable
GROUP BY customerId;
