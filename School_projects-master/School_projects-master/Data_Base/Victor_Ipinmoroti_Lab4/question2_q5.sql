Use Company;

go

Select e.LNAME , e.SSN 
From Employee e , WORKS_ON w ,
	(Select a.Pno , COUNT ( a.Essn)
	From WORKS_ON a , Employee e 
	Where a.Essn = e.SSN AND e.SEX = 'F' 
	Group By a.Pno ) as female (Pno, Fcount),

	(Select b.Pno, COUNT (b.Essn) 
	From WORKS_ON b, Employee f 
	Where b.Essn = f.SSN AND f.SEX = 'M' 
	Group by b.Pno ) as male (Pno, Mcount) 
Where e.SSN = w.Essn AND w.Pno = female.Pno AND female.Pno = male.Pno AND female.Fcount > male.Mcount ;

