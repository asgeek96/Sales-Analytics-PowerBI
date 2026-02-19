
-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    OrderDate DATE,
    Product VARCHAR(50),
    Region VARCHAR(50),
    Customer VARCHAR(50),
    Quantity INT,
    SalesAmount DECIMAL(12,2),
    Cost DECIMAL(12,2)
);

-- Total Sales
SELECT SUM(SalesAmount) AS TotalSales FROM Sales;

-- Profit Calculation
SELECT SUM(SalesAmount - Cost) AS TotalProfit FROM Sales;

-- Region Wise Sales
SELECT Region, SUM(SalesAmount) AS RegionSales
FROM Sales
GROUP BY Region;

-- Top 5 Customers
SELECT TOP 5 Customer, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Customer
ORDER BY TotalSales DESC;
