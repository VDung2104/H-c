/*==============Hiện xin chào + tên=============*/
Create procedure hienten
@ten varchar out
AS
Begin
set @ten = N'Dùng'
end
drop proc hienthiten
declare @ten_ varchar
EXEC hienten @ten_ out
print N'Xin Chào + ' + @ten











