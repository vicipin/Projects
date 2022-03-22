CREATE DATABASE COMPANY2;

GO

USE COMPANY2;

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

 ALTER TABLE EMPLOYEE ADD CONSTRAINT FKCONSTR1 /* we add and name a foreign constraint*/
 FOREIGN KEY (super_ssn) REFERENCES EMPLOYEE(ssn); /*foreign key of mgr_ssn that is refreced in employee as ssn*/

 alter table EMPLOYEE  add constraint fkemployee_dep
 foreign key (dno) references DEPARTMENT(dnumber); 

 ALTER TABLE dbo.EMPLOYEE NOCHECK CONSTRAINT fkemployee_dep /*dont check for this constraint*/
