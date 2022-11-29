create trigger trg_insertNhanVien on NhanVien
for insert
as 
	if(select luong from inserted)<15000
		begin
			print 'Luong Phan Lon Hon 15000'
			rollback transaction
		end
select * from NHANVIEN 
insert into NHANVIEN
values('Tran', 'Thanh', 'Huy', '021', '2020-12-12', 'Nam', 14000, '004', 1)

create trigger tr_insertNhanVien2 on NhanVien
for insert
as
	declare @age int
	set @age -= YEAR(GETDATE())- (select YEAR(NgSinh) from inserted)
	if(@age < 18 or @age > 65)
		begin
			print 'Tuoi Khong Hop Le'
			rollback transaction
		end
insert into NHANVIEN
values ('Tran', 'Thanh', 'Huy', '021', '2020-12-12', 'Nam', 14000, '004', 1)

create trigger trg_UpdateNhanVien on NhanVien
for update
as
	if(select dchi from inserted) like '%HCM%'
		begin 
			print 'Dia chi khong hop le'
			rollback transaction
		end
select * from NHANVIEN
update NHANVIEN set TENNV = 'NamNV' where MANV = '006'