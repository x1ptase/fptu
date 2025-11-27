SELECT
	P.PatientID,
	P.FirstName,
	P.LastName,
	P.BloodType,
	COUNT(A.AppointmentID) AS [NumberOfAppointments],
	ISNULL (SUM(B.TotalAmount), 0) AS [SumOfBillingTotalAmount]
	
FROM
	Patients AS P
	LEFT JOIN Appointments AS A ON A.PatientID=P.PatientID
		AND YEAR(A.AppointmentDate) IN (2020, 2021)
	LEFT JOIN Billing AS B ON A.AppointmentID=B.AppointmentID
WHERE 
	P.BloodType IN ('A+', 'A-')
GROUP BY
	P.PatientID, P.FirstName, P.LastName, P.BloodType