
select * from ecom.amazoncsv;
-- a.SELECT, WHERE, ORDER BY, GROUP BY
-- Select product name and price where price > 100, ordered by price descending
SELECT Item_Name, Total_Revenue FROM ecom.amazoncsv WHERE Total_Revenue > 70
ORDER BY Total_Revenue DESC LIMIT 5000;
-- Total items sold per Category
SELECT Category, SUM(Final_Quantity) AS total_quantity_sold FROM ecom.amazoncsv
GROUP BY Category ORDER BY total_quantity_sold DESC;

-- b.Use JOINS (INNER, LEFT, RIGHT)
DESC ecom.amazoncsv;
INSERT IGNORE INTO buyers (Buyer_ID, Buyer_Name, Country)
SELECT DISTINCT Buyer_ID, 'Unknown', 'Unknown'
FROM ecom.amazoncsv
WHERE Buyer_ID IS NOT NULL;

INSERT IGNORE INTO buyers (Buyer_ID, Buyer_Name, Country)
SELECT DISTINCT Buyer_ID, 'Unknown' AS Buyer_Name, 'Unknown' AS Country
FROM ecom.amazoncsv
WHERE Buyer_ID IS NOT NULL;
-- INNER JOIN
SELECT 
    a.Item_Name,
    a.Total_Revenue,
    b.Buyer_Name,
    b.Country
FROM ecom.amazoncsv a
INNER JOIN buyers b ON a.Buyer_ID = b.Buyer_ID;

-- LEFT JOIN
SELECT 
    a.Item_Name,
    a.Total_Revenue,
    b.Buyer_Name,
    b.Country
FROM ecom.amazoncsv a
LEFT JOIN buyers b ON a.Buyer_ID = b.Buyer_ID;

-- RIGHT JOIN
SELECT 
    a.Item_Name,
    a.Total_Revenue,
    b.Buyer_Name,
    b.Country
FROM ecom.amazoncsv a
RIGHT JOIN buyers b ON a.Buyer_ID = b.Buyer_ID;

-- Write subqueries
SELECT Item_Name, Buyer_ID, Total_Revenue
FROM ecom.amazoncsv
WHERE Buyer_ID IN (
    SELECT Buyer_ID
    FROM buyers
    WHERE Country = 'India'
);
-- Subquery in SELECT clause
SELECT 
    Item_Name,
    Buyer_ID,
    (SELECT COUNT(*) 
     FROM ecom.amazoncsv AS sub 
     WHERE sub.Buyer_ID = main.Buyer_ID) AS Buyer_Transaction_Count
FROM ecom.amazoncsv AS main;

-- Subquery in FROM clause
SELECT b.Buyer_ID, b.Buyer_Name, b.Country, t.Total_Revenue
FROM buyers b
JOIN (
    SELECT Buyer_ID, SUM(Total_Revenue) AS Total_Revenue
    FROM ecom.amazoncsv
    GROUP BY Buyer_ID
) t ON b.Buyer_ID = t.Buyer_ID;

-- d.Use aggregate functions (SUM, AVG)
-- Total Revenue of All Transactions
SELECT SUM(Total_Revenue) AS Total_Revenue_All
FROM ecom.amazoncsv;

-- Average Final Quantity Sold
SELECT AVG(Final_Quantity) AS Average_Quantity
FROM ecom.amazoncsv;

-- Total Revenue by Item
SELECT Item_Name, SUM(Total_Revenue) AS Total_Revenue
FROM ecom.amazoncsv
GROUP BY Item_Name
ORDER BY Total_Revenue DESC;

-- Average Refund per Item 
SELECT Item_Name, AVG(Refunds) AS Average_Refund
FROM ecom.amazoncsv
GROUP BY Item_Name
ORDER BY Average_Refund DESC;

-- Total Revenue by Country (JOIN with buyers)
SELECT b.Country, SUM(a.Total_Revenue) AS Country_Revenue
FROM ecom.amazoncsv a
JOIN buyers b ON a.Buyer_ID = b.Buyer_ID
GROUP BY b.Country;

-- e.Create views for analysis

-- Create a view for item revenue summary
CREATE VIEW item_revenue_summary AS
SELECT 
    Item_Name, 
    SUM(Total_Revenue) AS Total_Revenue,
    AVG(Total_Revenue) AS Average_Revenue,
    COUNT(*) AS Total_Transactions
FROM ecom.amazoncsv
GROUP BY Item_Name;
-- use
SELECT * FROM item_revenue_summary ORDER BY Total_Revenue DESC;

-- Create a view for buyer transaction summary
CREATE VIEW buyer_transaction_summary AS
SELECT 
    a.Buyer_ID,
    b.Buyer_Name,
    b.Country,
    COUNT(*) AS Total_Transactions,
    SUM(a.Total_Revenue) AS Total_Revenue
FROM ecom.amazoncsv a
JOIN buyers b ON a.Buyer_ID = b.Buyer_ID
GROUP BY a.Buyer_ID, b.Buyer_Name, b.Country;
-- use
SELECT * FROM buyer_transaction_summary ORDER BY Total_Revenue DESC;

-- Create a view for refunded items
CREATE VIEW refunded_items AS
SELECT 
    Item_Name,
    SUM(Refunds) AS Total_Refunded_Amount,
    SUM(Refunded_Item_Count) AS Total_Refunded_Units
FROM ecom.amazoncsv
GROUP BY Item_Name
HAVING Total_Refunded_Units > 0;

-- f. Optimize queries with indexes

-- Index on Buyer_ID (used in JOINs and WHERE)
CREATE INDEX idx_buyer_id ON ecom.amazoncsv (Buyer_ID);
-- Index on Item_Name (used in GROUP BY, ORDER BY)
CREATE INDEX idx_item_name ON ecom.amazoncsv (Item_Name(100));

-- Index on Total_Revenue (used in WHERE, ORDER BY)
CREATE INDEX idx_total_revenue ON ecom.amazoncsv (Total_Revenue);
-- Composite Index (Optional Advanced)
CREATE INDEX idx_buyer_date ON ecom.amazoncsv (Buyer_ID, Date(10));
-- table
SHOW INDEX FROM ecom.amazoncsv;


