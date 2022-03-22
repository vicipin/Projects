CREATE DATABASE COMPANY4;

GO

USE COMPANY4;

CREATE TABLE EMPLOYEE  /*create employee table*/
(fname		varchar(15)	not null,
 minit		char,
 lname		Varchar(15)	not null,
 ssn		char(9)		not null,
 bdate		date,
 adress		varchar(30),
 sex		char,
 salary		decimal(10,2),
 super_ssn	char(9),
 dno		int			not null,
 primary key (ssn),  /*assign primary key*/
 );

CREATE TABLE DEPARTMENT  /*create department table*/
(dname				varchar(15)	not null,
 dnumber			int			not null,
 mgr_ssn			char(9)		not null,
 mgr_sstart_date	date,
 primary key (dnumber), /*assign primary key*/
 unique (dname), /*make sure every dname is unique and there are no dublicate name*/
 foreign key (mgr_ssn) references EMPLOYEE(ssn), /*foreign key of mgr_ssn that is refreced in employee as ssn*/
 );

 /*we alter the employee table later for the sake of department table that is refrenced but not yet created*/
 ALTER TABLE EMPLOYEE ADD CONSTRAINT FKCONSTR1 /* we add and name a foreign constraint*/
 FOREIGN KEY (super_ssn) REFERENCES EMPLOYEE(ssn); /*foreign key of mgr_ssn that is refreced in employee as ssn*/

 alter table EMPLOYEE  add constraint fkemployee_dep
 foreign key (dno) references DEPARTMENT(dnumber); 



--insert into the table
ALTER TABLE dbo.EMPLOYEE NOCHECK CONSTRAINT fkemployee_dep /*dont check for this constraint*/


INSERT INTO COMPANY4.dbo.EMPLOYEE values
('John', 'B' , 'Smith' , '123456789', '09-Jan-55', '731 Fondren, Houston, TX' , 'M' , 30000 ,'987654321', 5),
('Franklin', 'T' , 'Wong' , '333445555', '08-Dec-45', '638 Voss, Houston, TX' , 'M' , 40000 ,'888665555', 5),
('Joyce', 'A' , 'English' , '453453453', '31-Jul-62', '5631 Rice, Houston, TX' , 'f' , 25000 ,'333445555', 5),
('Ramesh', 'K' , 'Narayan' , '666884444', '15-sep-52', '975 Fire Oak, Humble, TX' , 'M' , 38000 ,'333445555', 5),
('James', 'E' , 'Borg' , '888665555', '10-Nov-27', '450 Stone, Houston, TX' , 'M' , 55000 ,null, 1),
('Jennifer', 'S' , 'Wallace' , '987654321', '20-Jun-31', '291 Berry, Bellaire, TX' , 'F' , 43000 ,'888665555', 4),
('Ahmad', 'V' , 'Jabber' , '987987987', '29-Mar-59', '980 Dallas, Houston, TX' , 'M' , 25000 ,'987654321', 4),
('Alicia', 'J' , 'Zelaya' , '999887777', '19-Jul-58', '3321 Castle, SPring, TX' , 'F' , 25000 ,'987654321', 4),
('Alicia', 'J' , 'Zelaya' , '999887777', '19-Jul-58', '3321 Castle, SPring, TX' , 'F' , 25000 ,'987654321', 4);/*dupilicate touble*/


