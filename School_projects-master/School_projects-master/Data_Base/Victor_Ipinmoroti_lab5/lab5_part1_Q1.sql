use company

go
/*creating the Vdept_Budget view*/
create view VDept_Budget(Dept_Name,Dept_Number,No_Emp)/*view has 3 clomuns*/
as select	dname,dnumber,count(*)   /*dname dnumber and count the amount of times dnumber matches employee dnumber*/
from	DEPARTMENT,EMPLOYEE   /*using table department and employee*/
where   dnumber=dno   /*condition dnumber department is equal to dnumber employee*/
group by dname,dnumber;   /*we then group by dname*/
