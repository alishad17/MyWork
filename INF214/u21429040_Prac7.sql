use GotchaSystems

-- Question 1

SELECT
Stock_Item_Name,
Stock_Write_Off_Date
FROM Stock AS s
INNER JOIN StockWriteOff AS d
ON s.Stock_Item_ID = d.Stock_Item_ID
WHERE Stock_Write_Off_Date IN 
(SELECT MIN(Stock_Write_Off_Date) FROM StockWriteOff)

-- Question 2
SELECT
Supplier_ID,
Supplier_Name
FROM Supplier
WHERE Supplier_ID NOT IN 
(SELECT Supplier_ID FROM [Order])

-- Question 3
SELECT Stock_Item_Name,
Stock_Item_Description
FROM Stock
WHERE Stock_Item_ID IN
(SELECT Stock_Item_ID 
FROM StockReturned
WHERE Stock_Item_Name LIKE '%colour%')

-- Question 4
SELECT Payment_ID,
Payment_Amount,
Payment_Date
FROM Payment
WHERE Member_ID IS NULL OR Member_ID NOT IN
(SELECT Member_ID FROM Member)