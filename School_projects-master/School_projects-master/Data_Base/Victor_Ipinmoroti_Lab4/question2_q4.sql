Use Company;
go

Select e.LNAME
From Employee e 
Where  Exists (Select f.essn
	From Dependent f
		Where e.SSN=f.essn AND f.relationship='spouse')
			AND Exists (Select g.essn
	From Dependent g
		Where e.SSN=g.essn AND g.relationship='daughter')
			AND NOT Exists (Select h.essn
	From Dependent h
		Where e.SSN=h.essn AND h.relationship='son')

