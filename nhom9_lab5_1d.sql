/*==============Uoc chung lon nhat=============*/
create proc sp_lab5_1d
	@a int, @b int
As
	while (@a!=@b)
		if(@a>@b)
			set @a=@-@b
		else
			set @b=@b=@a
Return @a

declare @c int
exec @c=sp_lab5_1d 30,40
select @c as 'USCLN' 
