CREATE DATABASE IF NOT EXISTS test_database;

USE test_database;


CREATE TABLE test_data(
Order_ID INTEGER,
Product_Name VARCHAR(50),
Category VARCHAR(50),
Quantity INTEGER,
Price INTEGER,
PRIMARY KEY (Order_ID));


INSERT INTO test_data (Order_ID, Product_Name, Category, Quantity, Price) 
VALUES 
	(1, 'Laptop', 'Electronics', 5, 500), 
    (2, 'Headphones', 'Electronics', 3, 100), 
    (3, 'Chair', 'Furniture', 2, 200), 
    (4, 'Desk', 'Furniture', 1, 400), 
    (5, 'iPhone', 'Electronics', 2, 800), 
    (6, 'Book', 'Books', 10, 20), 
    (7, 'Shoes', 'Apparel', 4, 150), 
    (8, 'T-shirt', 'Apparel', 7, 50), 
    (9, 'Watch', 'Apparel', 1, 250),
    (10, 'Blender', 'Home Appliance', 1, 300), 
    (11, 'Fridge', 'Home Appliance', 1, 1200), 
    (12, 'Cookware Set', 'Home Appliance', 3, 100), 
    (13, 'Vacuum Cleaner', 'Home Appliance', 1, 350),
    (14, 'Keyboard', 'Electronics', 2, 75), 
    (15, 'Monitor', 'Electronics', 1, 200);
    
    
SELECT Product_Name, Price
FROM test_data
WHERE Category = 'Electronics'; 


SELECT Category, AVG(Price) as 'Average Price'
FROM test_data
WHERE Category = 'Apparel';   


SELECT *
FROM test_data
WHERE Price < 200;


SELECT Order_ID, Product_Name
FROM test_data
WHERE Quantity = 1;


SELECT Category, SUM(Price * Quantity) as 'Total Revenue'
FROM test_data
GROUP BY Category;