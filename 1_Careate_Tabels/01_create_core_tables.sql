-- استخدام قاعدة البيانات
USE HospitalDB;
GO

-- جدول المرضى
CREATE TABLE Patients (
    patient_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    date_of_birth DATE,
    gender NVARCHAR(10),
    phone NVARCHAR(20),
    address NVARCHAR(255)
);

-- جدول الأقسام
CREATE TABLE Departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100)
);

-- جدول الأطباء
CREATE TABLE Doctors (
    doctor_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    specialty NVARCHAR(100),
    phone NVARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- جدول المواعيد
CREATE TABLE Appointments (
    appointment_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    reason NVARCHAR(MAX),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
