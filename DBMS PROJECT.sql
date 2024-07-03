START TRANSACTION;

CREATE TABLE IF NOT EXISTS supplier (
  supplier_id varchar(5) PRIMARY KEY,
  address varchar(255),
  contact_no varchar(20)  
);

INSERT INTO supplier VALUES 
  (1, '123 Main Street, City A', '123-456-7890'),
  (2, '456 Oak Avenue, City B', '987-654-3210');
  
CREATE TABLE IF NOT EXISTS hospital (
  hospital_id int PRIMARY KEY, 
  location varchar(255),
  contact varchar(20)
);

INSERT INTO hospital VALUES
  (1, 'City General Hospital', '123-456-7890'), 
  (2, 'County Medical Center', '987-654-3210');
  
CREATE TABLE IF NOT EXISTS patient (
  patient_id varchar(20)PRIMARY KEY,
  age int,
  pname varchar(255)  
);

INSERT INTO patient VALUES
  ('c1', 25, 'John Doe'),
  ('c3', 30, 'Jane Smith');
  
CREATE TABLE IF NOT EXISTS oxygen_cylinder (
  cylinder_id varchar(10) PRIMARY KEY,
  capacity int,
  mnf_datetime datetime,
  exp_datetime datetime,
  hospital_id int,
  supplier_id varchar(5),
  FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)on delete cascade,
  FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)on delete cascade
);

INSERT INTO oxygen_cylinder VALUES
  (1, 2000, '2023-01-01 00:00:00', '2024-01-01 00:00:00', 1, 1),
  (2, 1500, '2023-02-01 00:00:00', '2024-02-01 00:00:00', 2, 2);
  
CREATE TABLE IF NOT EXISTS issue (
  patient_id varchar(20),
  cylinder_id varchar(10),
  date datetime,
  PRIMARY KEY (patient_id, cylinder_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)on delete cascade, 
  FOREIGN KEY (cylinder_id) REFERENCES oxygen_cylinder(cylinder_id)on delete cascade
);

INSERT INTO issue VALUES
  ('c1', 1, '2024-02-23 00:00:00'),
  ('c2', 2, '2024-02-23 00:00:00');
  
 
CREATE TABLE admin (
    USER_ID varchar(10) PRIMARY KEY,
    PASSWORD VARCHAR(255)
);


INSERT INTO admin (USER_ID, PASSWORD) VALUES
(1, 'password123'),
(2, '@rah123'),
(3, '@suj123');

update admin set PASSWORD='SUJAN' WHERE USER_ID=1;



  
COMMIT;

SELECT * FROM SUPPLIER;
SELECT * FROM patient;
SELECT * FROM OXYGEN_CYLINDER;
SELECT * FROM HOSPITAL;
SELECT * FROM ISSUE;
select * from admin;
commit;
delete from hospital where hospital_id=11;

SELECT patient.patient_id, cylinder.cylinder_id, cylinder.exp_datetime
FROM patient
JOIN oxygen_cylinder AS cylinder ON patient.patient_id = cylinder.patient_id;




commit;
USE STUDENTSOFTWARE;

DESC oxygen_cylinder
 

