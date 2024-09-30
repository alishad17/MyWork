-- question 1

SELECT
s.Supplier_Name,
CONCAT(s.Supplier_Rep_Name,' ',s.Supplier_Rep_Surname) AS 'Supplier Representative',
o.Order_Number,
COUNT(l.Order_Number) AS 'Products'
FROM Supplier AS s 
INNER JOIN [Order] AS o
ON s.Supplier_ID = o.Supplier_ID
INNER JOIN OrderLine as l
ON o.Order_Number = l.Order_Number
GROUP BY o.Order_Number, s.Supplier_Name,CONCAT(s.Supplier_Rep_Name,' ',s.Supplier_Rep_Surname), l.Order_Number
HAVING COUNT(l.Order_Number) >= '2'
ORDER BY Supplier_Name


-- question 2

SELECT 
t.Payment_Type_Description,
ISNULL(SUM(p.Payment_Amount),0) AS 'Total received',
COUNT(p.Payment_Type_ID) AS 'No. of payments'
FROM Payment AS p
RIGHT OUTER JOIN PaymentType AS t
ON t.Payment_Type_ID = p.Payment_Type_ID
GROUP BY p.Payment_Type_ID, t.Payment_Type_Description
ORDER BY COUNT(p.Payment_Type_ID) DESC

