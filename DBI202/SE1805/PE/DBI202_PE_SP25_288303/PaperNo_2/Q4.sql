SELECT
	D.DoctorID,
	D.FullName AS [DoctorFullName],
	P.PrescriptionID,
	P.Medicine,
	P.Dosage,
	P.PrescriptionDate,
	P.PatientID,
	P2.FirstName + ' ' + P2.LastName AS [PatientFullName]
FROM
	Doctors AS D
	LEFT JOIN Prescriptions AS P ON D.DoctorID=P.DoctorID
		AND P.PrescriptionDate BETWEEN '2020-05-15' AND '2020-09-15'
	LEFT JOIN Patients AS P2 ON P2.PatientID=P.PatientID
ORDER BY
	D.FullName ASC,
	P.PrescriptionDate
