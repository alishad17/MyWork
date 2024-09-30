Use Daspoort_Clinic

SELECT 
c.Con_Name,
c.Con_Priority,
c.Con_Chronic,
t.Con_Type_Name,s.Symptom_ID FROM Condition AS c
LEFT OUTER JOIN Condition_Type AS t 
ON c.Con_Type = t.Con_Type_ID 
LEFT OUTER JOIN Condition_Symptom AS s 
ON c.Con_ID = s.Con_ID
WHERE  Con_Type_Name = 'Disease'

SELECT 
Name,
Surname,
TelePhone 
FROM Patient
WHERE EXISTS (SELECT * 
FROM Consultation WHERE Patient_No = '1200001' 
AND Patient.Patient_No = Consultation.Patient_No) 
