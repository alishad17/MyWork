use Daspoort_Clinic

-- Question 1

SELECT *
FROM Province

-- Question 2

SELECT Doc_Name, Doc_Surname, Doc_Phone, Doc_Email
FROM Referral_Doctor

-- Question 3

SELECT *
FROM Patient
WHERE Gender = 'Male'

-- Question 4

SELECT *
FROM Medication
WHERE QtyAvailable < 100

-- Question 5

SELECT Clinic_Name, Clinic_Phone, Clinic_Address
FROM Referral_Clinic
WHERE Clinic_Address LIKE ('%Mashishing%')

--Question 6

SELECT *
FROM Consultation
WHERE Con_Hist_BMI  BETWEEN '95' AND '100'
ORDER BY Con_Hist_BMI DESC

-- Question 7

SELECT AVG(Con_Hist_HeartRate) AS Average_HeartRate
FROM Consultation