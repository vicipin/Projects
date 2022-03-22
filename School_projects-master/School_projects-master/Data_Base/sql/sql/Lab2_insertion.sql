USE COMPANY4;

go

 /*dont check for this constraint*/

 
 ALTER TABLE dbo.EMPLOYEE NOCHECK CONSTRAINT FKCONSTR1;
 ALTER TABLE dbo.EMPLOYEE NOCHECK CONSTRAINT fkemployee_dep;
 ALTER TABLE dbo.DEPARTMENT NOCHECK CONSTRAINT fkDEP_EMP;
 

INSERT INTO COMPANY4.dbo.EMPLOYEE values
('John', 'B' , 'Smith' , '123456789', '09-Jan-55', '731 Fondren, Houston, TX' , 'M' , 30000 ,'987654321', 5),
('Franklin', 'T' , 'Wong' , '333445555', '08-Dec-45', '638 Voss, Houston, TX' , 'M' , 40000 ,'888665555', 5),
('Joyce', 'A' , 'English' , '453453453', '31-Jul-62', '5631 Rice, Houston, TX' , 'f' , 25000 ,'333445555', 5),
('Ramesh', 'K' , 'Narayan' , '666884444', '15-sep-52', '975 Fire Oak, Humble, TX' , 'M' , 38000 ,'333445555', 5),
('James', 'E' , 'Borg' , '888665555', '10-Nov-27', '450 Stone, Houston, TX' , 'M' , 55000 ,null, 1),
('Jennifer', 'S' , 'Wallace' , '987654321', '20-Jun-31', '291 Berry, Bellaire, TX' , 'F' , 43000 ,'888665555', 4),
('Ahmad', 'V' , 'Jabber' , '987987987', '29-Mar-59', '980 Dallas, Houston, TX' , 'M' , 25000 ,'987654321', 4),
('Alicia', 'J' , 'Zelaya' , '999887777', '19-Jul-58', '3321 Castle, SPring, TX' , 'F' , 25000 ,'987654321', 4);

INSERT INTO COMPANY4.dbo.DEPARTMENT values
('Headquarters', 1, '888665555', '1971-06-19'),
('Administration', 4, '987654321', '1985-01-01'),
('Research', 5, '333445555', '1978-05-22'),
('Automation', 7, '123456789', '2006-10-05');

INSERT INTO COMPANY4.dbo.DEPT_LOCATIONS values
( 1, 'Houston'),
( 4, 'Stafford'),
( 5, 'Bellaire'),
( 5, 'Sugarland'),
( 5,'Houston');

INSERT INTO COMPANY4.dbo.PROJECT values
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO COMPANY4.dbo.WORKS_ON values
('123456789',1 ,32.5),
('123456789', 2,7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

INSERT INTO COMPANY4.dbo.[DEPENDENT] values
('123456789','Alice','F','31-Dec-78','Daughter'),
('123456789','Elizabeth','F', '05-May-57','Spouse'),
('123456789','Michael','M', '01-Jan-78','Son'),
('333445555','Alice','F', '05-Apr-76','Daughter'),
('333445555','Joy','F', '03-May-48','Spouse'),
('333445555','Theodore','M', '25-Oct-73','Son'),
('987654321','Abner','M', '29-Feb-32','Spouse');




