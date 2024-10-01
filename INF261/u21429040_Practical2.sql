Use Daspoort_Clinic

-- Question 1 --
SELECT CONCAT(Name,' ',Surname) AS Full_Name
FROM Patient 

-- Question 2 --
SELECT Patient_No, Name
FROM Patient
WHERE Gender = 'Female'

-- Question 3 --
SELECT Consult_No
FROM Consultation
WHERE Con_Hist_UrineTest='pH' AND Con_Hist_HeartRate>80

--Question 4--
SELECT Patient_No, Name, Surname
FROM Patient
WHERE Surname ='Tonga' AND Gender='Male'

-- Question 5 --
SELECT Patient.Patient_No,Name,Surname,Con_Consult_Date
FROM Patient INNER JOIN Consultation
ON Patient.Patient_No = Consultation.Patient_No

-- Question 6 --
SELECT Med_Type_Name, AVG(Medication.QtyAvailable) AS 'Average Qty'
FROM Medication INNER JOIN Medication_Type
ON Medication.Med_Type = Medication_Type.Med_Type_ID
WHERE Med_Type_Name = 'antibiotic'
GROUP BY Medication_Type.Med_Type_Name
ORDER BY 'Average Qty'