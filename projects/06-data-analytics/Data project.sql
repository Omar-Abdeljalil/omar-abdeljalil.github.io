

CREATE DATABASE Data_Project
 


USE Data_Project 

drop table Customers
drop table Products
drop table Sales


CREATE TABLE Customers (
    CustomerID   INT PRIMARY KEY IDENTITY(1,1),
    Name         NVARCHAR(100),
    Age          INT ,
    Gender       NVARCHAR(10) NULL,
    Income       NVARCHAR(20)     NULL,
    Region       NVARCHAR(20) NULL
);



CREATE TABLE Products (
    ProductID      INT PRIMARY KEY ,
    ProductName    NVARCHAR(100),
    Category       NVARCHAR(50),
    Price          DECIMAL(10,2),
    StockQuantity  INT
);


CREATE TABLE Sales (
    SaleID      INT PRIMARY KEY ,
    CustomerID  INT NOT NULL,         
    ProductID   INT NOT NULL,          
    SaleDate    DATE,
    Quantity    INT,
    TotalAmount INT
	FOREIGN KEY (CustomerID)  REFERENCES Customers(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
drop table Marketing_Campaigns

CREATE TABLE Marketing_Campaigns (
    CampaignID   INT PRIMARY KEY ,
    CampaignName NVARCHAR(100),
    StartDate    DATE,
    EndDate      DATE,
    Budget       MONEY,
    ProductID    INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);



BULK INSERT Customers
FROM 'C:\Users\Omar\Desktop\Customers.csv'
WITH (
	FIELDTERMINATOR = ',', 

    ROWTERMINATOR = '\n',   

    FIRSTROW = 2         
);

SELECT *FROM Customers





BULK INSERT Products
FROM 'C:\Users\Omar\Desktop\Data\Products.csv'
WITH (
	FIELDTERMINATOR = ',',  

    ROWTERMINATOR = '\n',   

    FIRSTROW = 2         
);
SELECT *FROM Products


BULK INSERT Sales
FROM 'C:\Users\Omar\Desktop\\Data\Sales.csv'
WITH (
	FIELDTERMINATOR = ',',  

    ROWTERMINATOR = '\n',  

    FIRSTROW = 2         
);
SELECT *FROM Sales

SELECT 
    Products.ProductName,
    SUM(Sales.TotalAmount) AS TotalSales
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
WHERE SaleDate >= '2024-01-01' AND SaleDate < '2024-02-01'
GROUP BY Products.ProductName
ORDER BY TotalSales DESC;

SELECT 
	SaleID
FROM Sales 
WHERE SaleDate >= '2024-01-01' AND SaleDate < '2024-02-01'


BULK INSERT Marketing_Campaigns
FROM 'C:\Users\Omar\Desktop\\Data\Marketing_Campaigns.csv'
WITH (
	FIELDTERMINATOR = ',',  -- Adjust based on your file format (e.g., tab `\t`)

    ROWTERMINATOR = '\n',   -- New line as row separator

    FIRSTROW = 2         -- Skip header row if necessary
);
SELECT *FROM Marketing_Campaigns




DELETE FROM Customers
WHERE Age IS NOT NULL AND (Age < 10 OR Age > 100);


UPDATE Customers
SET Gender = TRIM(Gender); 



UPDATE Customers SET Gender = 'Female' WHERE Gender IN ('Fe', 'F', 'f', 'Female', 'female');
UPDATE Customers SET Gender = 'Male' WHERE Gender IN ('Ma', 'M', 'm', 'Male', 'male');

UPDATE Customers SET Region = 'North' WHERE Region IN ('N', 'No', 'Nord', 'North');
UPDATE Customers SET Region = 'South' WHERE Region IN ('S', 'So', 'Sud', 'South');
UPDATE Customers SET Region = 'East'  WHERE Region IN ('E', 'Ea', 'Est', 'East');
UPDATE Customers SET Region = 'West'  WHERE Region IN ('W', 'We', 'Ouest', 'West');



SELECT CustomerID, COUNT(*) AS NumRows
FROM Customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

WITH Ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY Name) AS rn
  FROM Customers
)
DELETE FROM Ranked WHERE rn > 1;

SELECT *FROM Customers


UPDATE Customers
SET Name = UPPER(LEFT(Name, 1)) + LOWER(SUBSTRING(Name, 2, LEN(Name)));


-- Find the top 2 regions by customer count.
SELECT TOP 2 Region, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY Region
ORDER BY CustomerCount DESC;




-- Identify products with stock levels less than 170 units 
SELECT ProductID, ProductName, StockQuantity FROM Products
WHERE StockQuantity < 170;


-- Report Total sales for each product in January 2024
SELECT 
    ProductID,
    SUM(TotalAmount) AS TotalSales
FROM Sales
WHERE SaleDate >= '2024-01-01' AND SaleDate < '2024-02-01'
GROUP BY ProductID
ORDER BY ProductID DESC;


-- Segment customers by income group
SELECT IncomeGroup, COUNT(*) AS CustomerCount
FROM (
    SELECT 
        CASE 
            WHEN Income BETWEEN 0 AND 5000 THEN '0 - 5000'
            WHEN Income BETWEEN 5001 AND 10000 THEN '5001 - 10000'
            WHEN Income BETWEEN 10001 AND 15000 THEN '10001 - 15000'
            WHEN Income BETWEEN 15001 AND 20000 THEN '15001 - 20000'
            WHEN Income BETWEEN 20001 AND 25000 THEN '20001 - 25000'
            WHEN Income BETWEEN 25001 AND 30000 THEN '25001 - 30000'
            WHEN Income BETWEEN 30001 AND 35000 THEN '30001 - 35000'
            WHEN Income BETWEEN 35001 AND 40000 THEN '35001 - 40000'
            WHEN Income > 40000 THEN 'Above 40000'
            ELSE 'Unknown'
        END AS IncomeGroup
    FROM Customers
) AS GroupedData
GROUP BY IncomeGroup
ORDER BY IncomeGroup;


-- Calculate total sales grouped by product category, region, and a specified time period. Order the values by Total sales descending.
SELECT 
    Products.Category,
    Customers.Region,
    SUM(Sales.TotalAmount) AS TotalSales
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
WHERE Sales.SaleDate >= '2020-01-01' AND Sales.SaleDate < '2024-02-01'
GROUP BY Products.Category, Customers.Region
ORDER BY TotalSales DESC;


-- Calculate the average purchase amount grouped by age group and ordered by average purchase amount descending.

SELECT 
    +-CASE 
        WHEN Customers.Age < 20 THEN 'Less than 20'
        WHEN Customers.Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Customers.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Customers.Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS AgeGroup,
    AVG(Sales.TotalAmount) AS AvePurchaseAmount
FROM Sales
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
GROUP BY 
    CASE 
        WHEN Customers.Age < 20 THEN 'Less than 20'
        WHEN Customers.Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Customers.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Customers.Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END
ORDER BY AvePurchaseAmount DESC;

-- Provide total sales for each month along with the number of transactions 
SELECT
    YEAR(SaleDate) AS SaleYear,
    MONTH(SaleDate) AS SaleMonth,
    SUM(TotalAmount) AS TotalSales,
    COUNT(*) AS TransactionCount
FROM Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
ORDER BY SaleYear, SaleMonth;


-- Summarize total sales for each quarter and 
SELECT
    DATEPART(YEAR, SaleDate) AS Year,
    DATEPART(QUARTER, SaleDate) AS Quarter,
    SUM(TotalAmount) AS TotalSales
FROM Sales
GROUP BY DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
ORDER BY Year, Quarter;

-- Calculate the average spending per customer grouped by income brackets.
SELECT
    IncomeGroup,
    AVG(CustomerSpending) AS AvgSpendingPerCustomer
FROM (
    SELECT
        CASE
            WHEN CAST(Income AS INT) BETWEEN 0 AND 5000 THEN '0 - 5000'
            WHEN CAST(Income AS INT) BETWEEN 5001 AND 10000 THEN '5001 - 10000'
            WHEN CAST(Income AS INT) BETWEEN 10001 AND 15000 THEN '10001 - 15000'
            WHEN CAST(Income AS INT) BETWEEN 15001 AND 20000 THEN '15001 - 20000'
            WHEN CAST(Income AS INT) BETWEEN 20001 AND 25000 THEN '20001 - 25000'
            WHEN CAST(Income AS INT) BETWEEN 25001 AND 30000 THEN '25001 - 30000'
            WHEN CAST(Income AS INT) BETWEEN 30001 AND 35000 THEN '30001 - 35000'
            WHEN CAST(Income AS INT) BETWEEN 35001 AND 40000 THEN '35001 - 40000'
            WHEN CAST(Income AS INT) > 40000 THEN 'Above 40000'
            ELSE 'Unknown'
        END AS IncomeGroup,
        Customers.CustomerID,
       
        SUM(ISNULL(Sales.TotalAmount,0)) AS CustomerSpending
    FROM Customers
    LEFT JOIN Sales ON Customers.CustomerID = Sales.CustomerID
    GROUP BY Customers.CustomerID, Customers.Income
) AS SpendingPerCustomer
GROUP BY IncomeGroup
ORDER BY IncomeGroup;







































