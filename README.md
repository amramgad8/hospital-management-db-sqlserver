
<p align="center">
  <img src="https://github.com/amramgad8/hospital-management-db-sqlserver/raw/main/ERD_Hospital/github-banner.png" alt="Hospital Management DB System Banner" width="100%">
</p>



# 🏥 Hospital Management Database System

A full-featured SQL Server-based database system designed to simulate a real-world hospital environment. This project demonstrates entity relationships, business logic automation using stored procedures and triggers, and showcases complex query handling.

---

## 📁 Project Structure

```
HospitalDB/
│
├── 📄 Hospital_DB_Documentation.docx      # Full documentation including ERD and query results
├── 📄 Hospital_DB_Documentation_Complete  # Enriched documentation with screenshots
├── 📂 SQL Scripts/
│   ├── 01_create_core_tables.sql
│   ├── 02_prescriptions_and_medications.sql
│   ├── 03_admissions_and_rooms.sql
│   ├── 04_bills.sql
│   ├── 05_tests.sql
│   ├── 06_insurance.sql
│   ├── 07_staff.sql
│   ├── 08_insert_sample_data.sql
│   ├── 09_proc_add_appointment.sql
│   ├── 10_proc_get_patient_bills.sql
│   ├── 11_proc_discharge_patient.sql
│   ├── 12_proc_get_available_rooms.sql
│   ├── 13_trigger_free_room_on_discharge.sql
│   ├── 14_trigger_occupy_room_on_admission.sql
│   ├── 15_trigger_prevent_delete_doctor.sql
│   ├── 16_trigger_generate_bill_on_discharge.sql
```

---

## 🧱 Features Implemented

- 📌 Relational Schema Design with 13 core tables
- 🧠 Stored Procedures for operational logic
- ⚙️ Triggers for automation on data events
- 📝 Pre-inserted sample data to simulate real hospital operations
- 📸 Visuals including ER diagrams and query outputs

---

## 🗂️ Tables Overview

- `Patients`, `Doctors`, `Appointments`, `Departments`
- `Rooms`, `Admissions`, `Bills`, `Insurance`, `Staff`
- `Medications`, `Prescriptions`, `PrescriptionDetails`, `Tests`

---

## ⚙️ Stored Procedures

| Procedure Name               | Purpose |
|-----------------------------|---------|
| `AddAppointment`            | Insert appointment after validation |
| `GetPatientBills`           | Display all bills for a given patient |
| `DischargePatientAndFreeRoom` | Discharge patient and mark room available |
| `GetAvailableRoomsByType`   | List available rooms based on type |

---

## ⚡ Triggers

| Trigger Name                        | Function |
|------------------------------------|----------|
| `trg_FreeRoomOnDischarge`          | Free room automatically after discharge |
| `trg_OccupyRoomOnAdmission`        | Mark room as occupied after admission |
| `trg_PreventDeleteDoctorWithAppointments` | Block deleting doctors with appointments |
| `trg_GenerateBillOnDischarge`      | Auto-generate bill based on stay |

---

## 📊 Sample SQL Queries

```sql
-- List all available rooms
SELECT * FROM Rooms WHERE availability = 1;

-- Count appointments per doctor
SELECT d.name AS DoctorName, COUNT(a.appointment_id) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;

-- View all unpaid bills
SELECT * FROM Bills WHERE status = 'Unpaid';
```

---

## 🧪 How to Test

1. Restore or create the database using the provided scripts in order.
2. Run `08_insert_sample_data.sql` to seed the database.
3. Use procedures such as `AddAppointment`, `DischargePatientAndFreeRoom` to simulate operations.
4. Try update/delete operations to trigger triggers.
5. Query and validate expected behavior.

---

## 📷 Visuals

All visuals (ERD, Query Results, Triggers) are included in the `Hospital_DB_Documentation_Complete.docx` file.

---

## 🙌 Author
**Prepared by:** Amr Amgad Adel  
**Date:** April 19, 2025

---

## 📬 License
This project is shared for educational use. Feel free to fork, contribute, or expand upon it.

---

> For any suggestions or collaboration, open an issue or submit a pull request.

