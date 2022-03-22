USE COMPANY;
go

/*inserting into table*/

INSERT INTO EMPLOYEE VALUES(
'Victor',
'O',
'Ipinmoroti',
'083485382',
'30-Dec-1997',
'3959 Benjamin, Cincinnati, OH',
'M',
40000,
'987654321',
5);
INSERT INTO WORKS_ON VALUES(
'083485382',
2,
10);
INSERT INTO [DEPENDENT] VALUES (
'083485382',
'Deborah',
'F',
'20-Aug-2000',
'Sibling'); 

/*to check table*/
select * from EMPLOYEE
select * from DEPARTMENT
select * from [DEPENDENT]
select * from DEPT_LOCATIONS
select * from PROJECT
select * from WORKS_ON


