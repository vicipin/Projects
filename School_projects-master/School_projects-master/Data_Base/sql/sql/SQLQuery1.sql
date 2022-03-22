/*
* NAME: Victor Ipinmoroti
* ID: 2681928
* OBJECT:Create Table
*/

--Table

CREATE TABLE EMPLOYEE(
	FNAME	VARCHAR(25)	NOT NULL,
	MINIT	CHAR,
	LNAME	VARCHAR(25) NOT NULL,
	SSN		CHAR(9)		NOT NULL,
	BDATE	DATE,
	[ADDRESS]	VARCHAR(50)	NOT NULL,
	SEX		CHAR		NOT NULL,
	SALARY	DECIMAL(18,2),
	SUPERSSN CHAR(9),
	DNO		INT			NOT NULL
);