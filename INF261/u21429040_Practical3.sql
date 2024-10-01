USE Daspoort_Clinic
GO 

CREATE VIEW Patient_Consultation_view AS
SELECT TOP(5) p.Name, p.Surname, c.Con_Consult_Date
FROM Patient AS p
INNER JOIN Consultation AS c
ON p.Patient_No = c.Patient_No
WHERE c.Con_Hist_BMI > 80
ORDER BY p.Surname

Select * From Patient_Consultation_view