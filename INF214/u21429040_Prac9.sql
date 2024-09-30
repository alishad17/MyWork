use Daspoort_Clinic

-- Question 1--
SELECT *
FROM Consultation
WHERE Con_Consult_Date LIKE '%2012%'
ORDER BY Con_Consult_Date

-- Question 2

Select Count (*) AS Allergy
FROM Allergy 
INNER JOIN PatientAllergy ON Allergy.Allergy_ID = PatientAllergy.Allergy_ID
WHERE Allergy_Name LIKE '%Local anesthetics%'


-- Question 3
SELECT CONCAT(u.Name,' ', u.Surname) AS 'User',
a.LogDate,
a.Description
FROM Users AS u
INNER JOIN Audit_Log AS a
ON u.User_ID = a.UserID
WHERE a.Description LIKE '%Insert New%'

-- Question 4
SELECT Consult_No, Con_Weight
FROM Consultation
WHERE Con_Weight > (SELECT AVG(Con_Weight) FROM Consultation)

-- Question 5
SELECT Con_ID, Con_Name,
	CASE 
	WHEN Con_Chronic LIKE 'True' THEN 'Chronic'
	WHEN Con_Chronic Like 'False' THEN 'Acute'
	ELSE '0'
	END AS Con_Chronic
FROM Condition




