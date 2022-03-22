use COMPANY;

go

Select E.Fname, E.Lname, E.Dno, E.Super_ssn, D.Dnumber
From Department D LEFT OUTER JOIN Employee E
 On D.Dnumber = E.dno; 