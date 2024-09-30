use Daspoort_Clinic

-- Question 1
SELECT Name, Surname,
case when Title = '1' then 'Mr'
	else 'Mrs'
	end 'Title'
FROM Patient

-- Question 2
SELECT Name, Surname,
CASE WHEN Province_ID = 3 then 'Gauteng'
	ELSE '0'
	END 'Province'
FROM Patient
WHERE Province_ID = 3

-- Question 3
SELECT 
	Name,
	Surname,
	Description,
	LogDate
FROM Users, Audit_Log
	WHERE User_ID LIKE 2
	AND UserID LIKE 2
	AND Description LIKE '%Insert%'

-- Question 4
SELECT a.Patient_No,
       a.Name,
       a.Surname,
       b.Con_Consult_Date,
       c.Name,
       c.Surname
FROM Patient AS a
INNER JOIN Consultation AS b
ON a.Patient_No = b.Patient_No
INNER JOIN Users AS c
ON b.User_ID = c.User_ID
WHERE Con_Consult_Date LIKE '%2011%'

