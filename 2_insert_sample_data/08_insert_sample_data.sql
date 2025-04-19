USE HospitalDB;
GO

-- 🏥 Departments
INSERT INTO Departments (name) VALUES
(N'Cardiology'), (N'Neurology'), (N'Pediatrics'), (N'Emergency');

-- 🛏️ Rooms
INSERT INTO Rooms (room_number, room_type, availability) VALUES
('101', N'ICU', 1),
('102', N'General', 1),
('201', N'Private', 1);

-- 👤 Patients
INSERT INTO Patients (name, date_of_birth, gender, phone, address) VALUES
(N'Ali Youssef', '1985-06-15', 'Male', '01012345678', N'Cairo'),
(N'Samira Adel', '1990-01-20', 'Female', '01098765432', N'Giza');

-- 👨‍⚕️ Doctors
INSERT INTO Doctors (name, specialty, phone, department_id) VALUES
(N'Dr. Ahmed Nabil', N'Cardiologist', '0121111111', 1),
(N'Dr. Layla Hassan', N'Neurologist', '0122222222', 2);
--------------------------------------------------------------------------


-- 📅 Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-04-10 10:00', N'Chest Pain'),
(2, 2, '2025-04-11 12:30', N'Migraine and dizziness');

-- 💊 Medications
INSERT INTO Medications (name, description, dosage) VALUES
(N'Panadol', N'Pain reliever and fever reducer', N'500mg'),
(N'Aspirin', N'Reduces inflammation and blood clots', N'100mg');

-- 📋 Prescriptions
INSERT INTO Prescriptions (appointment_id, date_issued, notes) VALUES
(1, '2025-04-10', N'Take after meals'),
(2, '2025-04-11', N'One daily before sleeping');

-- 🧾 PrescriptionDetails
INSERT INTO PrescriptionDetails (prescription_id, medication_id, quantity) VALUES
(1, 1, 10),
(2, 2, 5);

--------------------------------------------------------------------------------

-- 🛏️ Admissions
INSERT INTO Admissions (patient_id, room_id, admission_date, discharge_date, diagnosis) VALUES
(1, 1, '2025-04-10', '2025-04-15', N'Heart Attack'),
(2, 2, '2025-04-11', NULL, N'Severe Migraine');

-- 💳 Bills
INSERT INTO Bills (patient_id, admission_id, amount, bill_date, status) VALUES
(1, 1, 3500.00, '2025-04-15', 'Paid'),
(2, 2, 1200.00, GETDATE(), 'Pending');

-- 🧪 Tests
INSERT INTO Tests (appointment_id, test_name, result, test_date) VALUES
(1, N'ECG', N'Irregular heartbeat detected', '2025-04-10'),
(2, N'MRI Brain', N'Mild inflammation observed', '2025-04-11');

-- 🛡️ Insurance
INSERT INTO Insurance (patient_id, provider_name, policy_number, coverage_percent) VALUES
(1, N'Misr Insurance', 'MISR2023-001', 80),
(2, N'MedRight', 'MR-9981', 70);

-- 👥 Staff
INSERT INTO Staff (name, role, phone, department_id) VALUES
(N'Sara Mostafa', N'Nurse', '01123456789', 1),
(N'Mohamed Fathy', N'Admin', '01076543210', 4);
