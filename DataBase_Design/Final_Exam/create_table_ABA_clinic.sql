create table insurancecompany
(InsCo_ID varchar(8) primary key,
name varchar(30),
InsCo_Street varchar(30),
InsCo_City varchar(20),
InsCo_State varchar(2),
InsCo_Zipcode varchar(10),
InsCo_Tele varchar(13));

create table parent
(Parent_ID varchar(5) primary key,
Last_Name varchar(25),
First_Name varchar(25),
Parent_Street varchar(30),
Parent_City varchar(20),
Parent_State varchar(2),
Parent_Zipcode varchar(10),
Parent_Tele varchar(13));



create table insurancepolicy
(Policy_No varchar(5) primary key,
InsCo_ID varchar(8) references insurancecompany(InsCo_ID),
Parent_ID varchar(5) references parent(Parent_ID),
Effective_Date date);
InsCo_ID varchar(8) references insurancecompany(InsCo_ID),
Parent_ID varchar(5) references parent(Parent_ID),
Effective_Date date);

create table client
(Client_ID varchar(5) primary key,
First_Name varchar(25) not null,
Last_Name varchar(25) not null,
DOB date,
Age numeric(3,1));

create table clienttoparent
(Client_ID varchar(5) references client(Client_ID),
Parent_ID varchar(5) references parent(Parent_ID),
Relation_Description varchar(40),
primary key(Client_ID, Parent_ID));

create table clientallergies
(Client_ID varchar(5) references client(Client_ID),
Allergy varchar(20),
Description varchar(40),
primary key(Client_ID, Allergy));

create table diagnosis
(Diagnosis_Code varchar(8) primary key,
Description varchar(40));

create table presentdiagnosis
(Client_ID varchar(5) references client(Client_ID),
 Diagnosis_Code varchar(8) references diagnosis(Diagnosis_Code),
 Diagnosis_Date date,
 primary key(Client_ID, Diagnosis_Code));
Diagnosis_Code varchar(8),
Description varchar(40),
primary key(Client_ID, Diagnosis_Code));

create table room
(Room_ID varchar(5) primary key,
Capacity numeric(4.2),
Max_Occupents int(2));

create table timeslot
(TimeSlot_ID varchar(5) primary key,
Datofweek varchar(4) check(Dateofweek in ('Mon','Tue','Wed','Thu','Fri', 'Sat','Sun')),
Start_Time varchar(10),
End_Time varchar(10));

create table therapy
(Therapy_ID varchar(5) primary key,
Name varchar(20) not null,
Recom_Unit int(2),
Cost_per_Unit numeric(4,2));

create table serviceprovided
(Emp_ID varchar(5) references employee(Emp_ID),
 Client_ID varchar(5) references client(Client_ID),
 Room_ID varchar(5) references room(Room_ID),
 TimeSlot_ID varchar(5) references timeslot(TimeSlot_ID),
 Therapy_ID varchar (5) references therapy(Therapy_ID),
 Serv_Date date,
 Serv_Duration int(2),
 primary key(Emp_ID, Client_ID));
 
 create table employee
 (Emp_ID varchar(5) primary key,
  First_Name varchar(20) not null,
  Last_Name varchar(20) not null,
  Position varchar(8),
  Salary   numeric(10,2),
  DateofHire date,
  DOB date);
  
  create table empolyeeskills
  (Emp_ID varchar(5) references employee(Emp_ID),
   Skill  varchar(20),
   description varchar(40),
   primary key(Emp_ID, Skill));
   
   create table employdegree
   (Emp_ID varchar(5) references employee(Emp_ID),
   Degree varchar(8),
   DateofObtain date,
   primary key(Emp_ID, Degree));
   
   create table employcertificate
   (Emp_ID varchar(5) references employee(Emp_ID),
   Certificate_No varchar(8) primary key,
   DateofIssue date);