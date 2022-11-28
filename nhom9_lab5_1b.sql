/*==============Tinh tong=============*/
Create procedure spTong @so1 int, @so2 int
As
Begin
Declare @Tong int;
SET @Tong = @so1 + @so2
print @Tong
End