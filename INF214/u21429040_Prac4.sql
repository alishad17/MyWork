use GotchaSystems

-- Question 1

SELECT s.Stock_Item_Name,
		w.Stock_Write_Off_Date,
		w.Stock_Write_Off_Quantity,
		w.Stock_Write_Off_Reason
		FROM Stock AS s
		LEFT OUTER JOIN StockWriteOff AS w
		ON s.Stock_Item_ID = w.Stock_Item_ID

-- Question 2

SELECT CONCAT(t.Title_Name, '. ',
		s.Supplier_Rep_Name, ' ', s.Supplier_Rep_Surname) AS 'Supplier Representatives'
		FROM Title AS t
		RIGHT JOIN Supplier AS s
		ON t.Title_ID = s.Title_ID

-- Question 3

SELECT b.Booking_Number,
		c.Booking_Calendar_Date,
		CONVERT(TIME,s.Booking_Session_Time) AS Time,
		s.Booking_Session_Guests_Attending
		FROM Booking AS b 
		INNER JOIN BookingSession AS s
		ON b.Booking_Session_ID = s.Booking_Session_ID
		INNER JOIN BookingCalendar AS c
		ON s.Booking_Calendar_ID = c.Booking_Calendar_ID
		WHERE b.Booking_Status_ID = '1'

