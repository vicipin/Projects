Use Company;
go

Select e.FNAME, e.LNAME
From Employee e 
Where Exists (Select A.essn
	From Dependent A
		Where e.SSN=A.essn AND A.relationship='spouse') /* first we get sposes*/
			AND Exists (Select B.DNAME
From Department B
			Where e.DNO=B.DNUMBER AND B.DNAME='Research')
			AND NOT Exists (Select C.essn/* then we get those who have children in research  compare and take the missing row */
	From Dependent C
Where e.SSN=C.essn AND (C.relationship='daughter' OR C.relationship='son'))

