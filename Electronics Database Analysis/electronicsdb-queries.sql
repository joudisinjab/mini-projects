USE electronicsdb;


SELECT 
	P.ProductName, 
    PC.CategoryName, 
    S.SupplierName
FROM products AS P
INNER JOIN productcategories AS PC
	ON PC.CategoryID = P .CategoryID
INNER JOIN suppliers AS S
	ON S.SupplierID = P .SupplierID;


SELECT 
    P.ProductName, 
    S.SupplierName
FROM products AS P
INNER JOIN suppliers AS S
    ON P.SupplierID = S.SupplierID
WHERE 
    S.SupplierID = (
        SELECT SupplierID 
        FROM products
        WHERE ProductName = 'Alpha Smartphone'
    );


SELECT *
FROM products
WHERE CategoryID = 31 OR SupplierID = 50;


SELECT 
	ProductID, 
    SUM(QuantityInStock) AS `Total Number in Stock`
FROM storeinventory
GROUP BY ProductID
ORDER BY ProductID ASC;


SELECT 
	PC.CategoryID, 
    PC.CategoryName, 
    AVG(si.QuantityInStock) AS AverageStock
FROM productcategories AS PC
JOIN products P 
	ON PC.CategoryID = P .CategoryID
JOIN storeinventory SI 
	ON P .ProductId = SI.ProductId
GROUP BY PC.CategoryID
HAVING AVG(SI.QuantityInStock) > 70;


SELECT 
    PC.CategoryID, 
    PC.CategoryName, 
    P.ProductID, 
    P.ProductName
FROM productcategories AS PC
JOIN products AS P 
	ON PC.CategoryID = P.CategoryID
JOIN suppliers AS S 
	ON P.SupplierID = S.SupplierID
WHERE PC.CategoryName = 'Cameras';


SELECT 
    P.CategoryID, 
    AVG(SI.QuantityInStock) AS `AverageStock`, 
    SUM(SI.QuantityInStock) AS `TotalStock`
FROM products AS P
INNER JOIN storeinventory AS SI 
	ON P.ProductID = SI.ProductID
GROUP BY P.CategoryID
HAVING SUM(SI.QuantityInStock) > AVG(SI.QuantityInStock);

