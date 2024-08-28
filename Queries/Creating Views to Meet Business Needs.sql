-- SQL Query for Store Inventory View:

CREATE VIEW Story_Inventory AS
SELECT
 c.Store_ID,
 c.Address,
 p.Product_ID,
 COALESCE(ci.Name, mi.Title, mui.Title, bi.Title) AS Product_Name,
 p.Stock
FROM
 Cafes c
CROSS JOIN
 Products p
LEFT JOIN
 Cafe_Items ci ON p.Product_ID = ci.Product_ID
LEFT JOIN
 Movie_Items mi ON p.Product_ID = mi.Product_ID
LEFT JOIN
 Music_Items mui ON p.Product_ID = mui.Product_ID
LEFT JOIN
 Book_Items bi ON p.Product_ID = bi.Product_ID;

SELECT * FROM Story_Inventory
ORDER BY Store_ID, Stock DESC;

-- SQL Query for Store Sales View:

CREATE VIEW Store_Sales AS
SELECT
 s.Store_ID,
 c.Address,
 COUNT(t.Sales_ID) AS Number_of_Sales,
 SUM(t.Total_Paid) AS Total_Sales
FROM
 Cafes c
JOIN
 Staff s ON c.Store_ID = s.Store_ID
JOIN
 Transactions t ON s.Employee_ID = t.Employee_ID
GROUP BY
 s.Store_ID, c.Address;
select * from Store_Sales-- SQL Query for Company Wide Sales & Stock View:

/*
Please note that if any Product_ID does not have any corresponding sales, it will show
as having 0.
*/

CREATE VIEW Company_Wide_Sales_Stock AS
SELECT
 p.Product_ID,
 COALESCE(ci.Name, mi.Title, mui.Title, bi.Title) AS Product_Name,
 COALESCE(SUM(si.Quantity_Sold), 0) AS Total_Copies_Sold,
 p.Stock AS Initial_Stock_Number,
 CASE
 WHEN COALESCE(SUM(si.Quantity_Sold), 0) = 0 THEN p.Stock
 ELSE p.Stock - COALESCE(SUM(si.Quantity_Sold), 0)
 END AS Copies_Remain
FROM
 Products p
LEFT JOIN
 Sale_Items si ON p.Product_ID = si.Product_ID
LEFT JOIN
 Cafe_Items ci ON p.Product_ID = ci.Product_ID
LEFT JOIN
 Movie_Items mi ON p.Product_ID = mi.Product_ID
LEFT JOIN
 Music_Items mui ON p.Product_ID = mui.Product_ID
LEFT JOIN
 Book_Items bi ON p.Product_ID = bi.Product_ID
GROUP BY
 p.Product_ID, p.Stock, ci.Name, mi.Title, mui.Title, bi.Title;

select * from Company_Wide_Sales_Stock

-- SQL Query for Store Specific Sales & Stock View:CREATE VIEW Store_Specific_Sales_Stock AS
SELECT
 c.Store_ID,
 c.Address,
 p.Product_ID,
 COALESCE(ci.Name, mi.Title, mui.Title, bi.Title) AS Product_Name,
 COALESCE(SUM(si.Quantity_Sold), 0) AS Total_Copies_Sold,
 p.Stock AS Initial_Stock_Number,
 CASE
 WHEN COALESCE(SUM(si.Quantity_Sold), 0) = 0 THEN p.Stock
 ELSE p.Stock - COALESCE(SUM(si.Quantity_Sold), 0)
 END AS Copies_Remain
FROM
 Cafes c
JOIN
 Staff s ON c.Store_ID = s.Store_ID
JOIN
 Transactions t ON s.Employee_ID = t.Employee_ID
JOIN
 Sale_Items si ON t.Sales_ID = si.Sales_ID
JOIN
 Products p ON si.Product_ID = p.Product_ID
LEFT JOIN
 Cafe_Items ci ON p.Product_ID = ci.Product_ID
LEFT JOIN
 Movie_Items mi ON p.Product_ID = mi.Product_ID
LEFT JOIN
 Music_Items mui ON p.Product_ID = mui.Product_ID
LEFT JOIN
 Book_Items bi ON p.Product_ID = bi.Product_ID
GROUP BY
 c.Store_ID, c.Address, p.Product_ID, p.Stock, ci.Name, mi.Title, mui.Title, bi.Title;

select * from Store_Specific_Sales_Stock

-- SQL Query for Employee Hours View:CREATE VIEW Employee_Hours AS
SELECT
 s.Employee_ID,
 s.Name AS Employee_Name,
 s.Store_ID,
 SUM(sh.Hours_Worked) AS Total_Hours_Worked
FROM
 Staff s
JOIN
 Shift_Hours sh ON s.Employee_ID = sh.Employee_ID
GROUP BY
 s.Employee_ID, s.Name, s.Store_ID;

select * from Employee_Hours

-- SQL Query for Weekly Store Profits View:

CREATE VIEW Weekly_Store_Profits AS
SELECT
 c.Store_ID,
 c.Address,
 DATE_TRUNC('week', t.Date) AS Week,
 SUM(t.Total_Paid) AS Weekly_Sales,
 (SELECT SUM(Salary) / 52 FROM Staff s WHERE s.Store_ID = c.Store_ID) AS Weekly_Staff_Cost,
 SUM(t.Total_Paid) - (SELECT SUM(Salary) / 52 FROM Staff s WHERE s.Store_ID = c.Store_ID) AS Weekly_Profit
FROM
 Cafes c
JOIN
 Staff s ON c.Store_ID = s.Store_ID
JOIN
 Transactions t ON s.Employee_ID = t.Employee_ID
GROUP BY
 c.Store_ID, c.Address, DATE_TRUNC('week', t.Date);

select * from Weekly_Store_Profits
order by Store_ID, Week asc