use COMPANY;

go

Select e.SSN, e.LNAME
From Employee e, Dependent d
Where e.SSN=d.essn AND e.SEX='F' AND d.relationship='spouse' AND
e.SSN IN (Select w.Essn
From WORKS_ON w
Group By w.Essn
Having COUNT(w.Essn)>=3);