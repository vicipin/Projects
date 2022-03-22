use COMPANY

go

create or alter procedure sp_report_new_budget
		
as

declare		@Count	int
declare		@newDept_Name     char(30) /* declare varaibles*/
declare		@newDept_No       int
declare		@count_Emp		  int
declare		@new_Sum_Salary	  int
declare		@new_Ave_Salary   int

/*check if table exist or not*/ /* for personal use not realy needed*/
if not exists(SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'NEW_Dept_Budget')
Begin
CREATE TABLE  NEW_Dept_Budget  /*create NEW_Dept_Budget table*/
(
newDept_Name     char(30),
newDept_No       int,
count_Emp		 int,
new_Sum_Salary	 int,
new_Ave_Salary   int,
primary key (newDept_Name),  /*assign primary key*/
 );
End

select	@Count=COUNT(*)/* check if the view is empty*/
from	dbo.VDept_Budget


if @Count=0 /* if view is empty purpulate it*/
	Begin
		print	'view is empty porpulate it'
		return
	end

declare budget_cursor cursor for /* declare cursor to check each cell for each row in the view*/
	select Dept_Name, Dept_Number,No_Emp,Sum_Salary,Ave_Salary
	from	dbo.VDept_Budget

open budget_cursor 
fetch next from budget_cursor into @newDept_Name, @newDept_No, @count_Emp, @new_Sum_Salary, @new_Ave_Salary	 /*for each value checked put that vale into this variables*/
		while @@FETCH_STATUS=0
		begin
			if @newDept_No=1 /*for each case change sum as needed given that we change the sum avrage is not affected be cause we scale up and amount does not change*/
			begin
			insert into dbo.NEW_Dept_Budget
							(newDept_Name, newDept_No,count_Emp, new_Sum_Salary, new_Ave_Salary)
						values(@newDept_Name, @newDept_No, @count_Emp, ((@new_Sum_Salary*0.1)+@new_Sum_Salary), @new_Ave_Salary)
						fetch next from budget_cursor into @newDept_Name,@newDept_No,@count_Emp,@new_Sum_Salary,@new_Ave_Salary
			end
			if @newDept_No=4
			begin
			insert into dbo.NEW_Dept_Budget
							(newDept_Name, newDept_No,count_Emp, new_Sum_Salary, new_Ave_Salary)
						values(@newDept_Name, @newDept_No, @count_Emp, ((@new_Sum_Salary*0.2)+@new_Sum_Salary), @new_Ave_Salary)
						fetch next from budget_cursor into @newDept_Name,@newDept_No,@count_Emp,@new_Sum_Salary,@new_Ave_Salary
			end
			if @newDept_No=5
			begin
			insert into dbo.NEW_Dept_Budget
							(newDept_Name, newDept_No,count_Emp, new_Sum_Salary, new_Ave_Salary)
						values(@newDept_Name, @newDept_No, @count_Emp, ((@new_Sum_Salary*0.3)+@new_Sum_Salary), @new_Ave_Salary)
						fetch next from budget_cursor into @newDept_Name,@newDept_No,@count_Emp,@new_Sum_Salary,@new_Ave_Salary
			end
			if @newDept_No=7
			begin
			insert into dbo.NEW_Dept_Budget
							(newDept_Name, newDept_No,count_Emp, new_Sum_Salary, new_Ave_Salary)
						values(@newDept_Name, @newDept_No, @count_Emp, ((@new_Sum_Salary*0.4)+@new_Sum_Salary), @new_Ave_Salary)
						fetch next from budget_cursor into @newDept_Name,@newDept_No,@count_Emp,@new_Sum_Salary,@new_Ave_Salary
			end
		end
close budget_cursor
deallocate budget_cursor



