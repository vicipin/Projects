
USE  COMPANY_3;

GO

USE COMPANY;

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
 );

CREATE TABLE DEPARTMENT  /*create department table*/
(dname				varchar(15)	not null,
 dnumber			int			not null,
 mgr_ssn			char(9)		not null,
 mgr_sstart_date	date,
 );

 ALTER TABLE EMPLOYEE ADD CONSTRAINT PKCONSTR primary KEY (ssn);

 /*we alter the employee table later for the sake of department table that is refrenced but not yet created*/
 ALTER TABLE EMPLOYEE ADD CONSTRAINT FKCONSTR1 /* we add and name a foreign constraint*/
 FOREIGN KEY (super_ssn) REFERENCES EMPLOYEE(ssn); /*foreign key of mgr_ssn that is refreced in employee as ssn*/

 alter table EMPLOYEE  add constraint fkemployee_dep
 foreign key (dno) references DEPARTMENT(dnumber); 

 ALTER TABLE DEPARTMENT ADD CONSTRAINT PKCONSTR_DEP primary key (dnumber);
 ALTER TABLE DEPARTMENT ADD CONSTRAINT UNIQ_DEP unique (dname);
 alter table DEPARTMENT  add constraint fkDEP_EMP
 foreign key (mgr_ssn) references EMPLOYEE(ssn);



/*we create the other table but include and primary and forign key in them given that the componet are in prevoius table or current table*/
CREATE TABLE DEPT_LOCATIONS
(dnumber			int			not null,
 dlocation			varchar(15)	not null,
 primary key (dnumber,dlocation),
 foreign key (dnumber) references DEPARTMENT(dnumber),
 );

CREATE TABLE PROJECT
(pname				varchar(15)	not null,
 pnumber			int			not null,
 plocation			varchar(15),	
 dnum				int			not null,
 primary key (pnumber),
 unique (pname),
 foreign key (dnum) references DEPARTMENT(dnumber),
 );

CREATE TABLE WORKS_ON
(essn			char(9)			not null,
 pno			int				not null,
 [hours]		DECIMAL(3,1)	not null,
 primary key (essn,pno),
 foreign key (essn) references EMPLOYEE(ssn),
 foreign key (pno) references PROJECT(pnumber),
 );

CREATE TABLE [DEPENDENT]
(essn				char(9)	    not null,
 dependent_name		varchar(15)	not null,
 sex				char,
 bdate				date,
 relationship		varchar(8),
 primary key (essn,dependent_name),
 foreign key (essn) references EMPLOYEE(ssn),
 );







