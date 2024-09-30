-- Question 1

SELECT 
CONCAT(Member_Name,' ', Member_Surname) AS Members
FROM Member

-- Question 2

SELECT
Order_Number,
Supplier_Invoice_Number,
CONCAT('R',Supplier_Invoice_Total_Amount) AS "Total Price"
FROM SupplierInvoice

-- Question 3
SELECT
Employee_Name,
Employee_Surname,
CONCAT(DAY(Commencement_Date),' ', DATENAME(month,Commencement_Date), ' ', YEAR(Commencement_Date)) AS "Commencement Date"
FROM Employee
ORDER BY month(Commencement_Date)

-- Question 4
SELECT
Employee_Name,
Employee_Surname,
SUBSTRING(Employee_ID_Number,1,6) AS "DOB",
DATEDIFF(yy,SUBSTRING(Employee_ID_Number,1,6), getdate()) AS "Age"
FROM Employee
WHERE DATEDIFF(yy,SUBSTRING(Employee_ID_Number,1,6), getdate())  > '40'
ORDER BY Employee_Name
