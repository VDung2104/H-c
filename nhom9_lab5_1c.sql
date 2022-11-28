/*==============Tong so chan=============*/
create procedure sp_lab5_1c
	@n int
As
	Declare @tong int=0,@dem int=2;
	while @dem<@n
		begin
			set @tong=@tong+@dem
			set @dem=@dem + 2
		end
	print 'Tong' + cast(@tong as varchar(4))