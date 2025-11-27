SELECT A.AppointmentID, A.AppointmentDate, D.DoctorID, D.FullName AS [DoctorFullName],
D.Specialty, P.PatientID, P.FirstName + ' ' + P.LastName AS [PatientFullName]
FROM Appointments AS A
INNER JOIN Doctors AS D ON D.DoctorID=A.DoctorID
INNER JOIN Patients AS P ON P.PatientID=A.PatientID
WHERE D.Specialty='Orthopedics'