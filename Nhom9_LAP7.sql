--Nhap vao MaNV cho biet tuoi cua nhan vien--
select YEAR(getdate())-YEAR(NGSINH) as N'Tuổi' from NHANVIEN where MANV = '001'

if OBJECT_ID('fn_TuoiNV') is not null
	drop function fn_TuoiNV
go 
create function fn_TuoiNV(@MaNV nvarchar(9))
returns int
as
begin
	return(selectt YEAR(getdate())-YEAR(NGSINH) as N'Tuổi'
		from NHANVIEN where MANV = @MaNV)
end 
print 'Tuoi nhan vien:'+ convert(nvarchar,dbo.fn_TuoiNV('002'))
print 'Tuoi nhan vien:'+ convert(nvarchar,dbo.fn_TuoiNV('003'))
--Nhap vao Manv cho biet so luong de an nhan vien nay da tham gia--
select Ma_NVien, COUNT(MADA) from PHANCONG
group by Ma_NVien

select COUNT(MADA) from PHANCONG where MA_NVIEN = '004'

if OBJECT_ID('fn_DemDeAnNV') is not null
	drop function fn_DemDeAnNV
go
create function fn_DemDeAnNV(@MaNV varchar(9))
returns int
as
	begin
		return(select COUNT(MADA) from PHANCONG where MA_NVIEN= @MaNV)
	end
print 'so Du an nhan vien da lam'+ convert(varchar, dbo.fn_DemDeAnNV('004'))

--Truyen tham so vao phai nam hoac nu, xuat so luong nhann vien theo phai--
select * from NHANVIEN
select COUNT(*) from NHANVIEN where PHAI like 'Nam'
select COUNT(*) from NHANVIEN where PHAI like N'Nữ'

create function fn_DemNV_Phai(@Phai nvarchar(5)=N'%')
returns int
as 
	begin
		return(select COUNT(*) from NHANVIEN where PHAI like @phai)
	end
print 'Nhan vien nam:'+ convert(varchar, fn_DemNV_Phai('Nam'))
print 'Nhan vien nam:'+ convert(varchar, fn_DemNV_Phai(N'Nữ'))
--2d--

select PHG, TENPHG, AVG(LUONG) from NHANVIEN
inner join PHONGBAN on OHONGBAN.MAPHG = NHANVIEN.PHG
group by PHG, TENPHG

select AVG(LUONG) from NHANVIEN
inner join PHONGBAN on OHONGBAN.MAPHG = NHANVIEN.PHG
where TENPHG = 'IT'

if OBJECT_ID('') is not null
	drop function fn_Luong_NhanVien_PB
crete function fn_Luong_NhanVien_PB(@TenPhongBan nvarchar(20))
returns @tbLuongNV table(fullname nvarchar(50),luong float)
as 
	begin
		declare @LuongTB float
		select @LuongTB = AVG(LUONG) from NHANVIEN
		inner join PHONGBAN on OHONGBAN.MAPHG = NHANVIEN.PHG
		where TENPHG = @TenPhongBan
		--print 'Luong Trung Binh:'+ convert(nvarchar,@LuongTB)
		--insert vao table
		insert into @tbLuongNV
			select HONV+ ''+TENLOT+''+TENNV, LUONG from NHANVIEN
			where LUONG > @LuongTB
		return
	end

--2e
select TENPHG,TRPHG,HONV+''+TENLOT+ ' ' + TENNV as 'Ten Truong Phog', COUNT(MADA) á 'SoLuongDeAn'
from PHONGBAN
inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.MANV = PHONGBAN.TRPHG
where PHONGBAN>MAPHG = '001'
group by TENPHG,TGPHG,TENNV,HONV,TENLOT

if OBJECT_ID('fn_SoLuongDeAnTheoPB') is not null
	drop function fn_SoLuongDeAnTheoPB
	go
create function fn_SoLuongDeAnTheoPB(@MaPB int)
returns @tbListPB table(TenPB nvarchar(20),MaTB nvarchar(10), TenTP nvarchar(50), soluong int)
as
begin
	insert into @tbListPB
	select TENPHG,TRPHG,HONV+''+TENLOT+ ' ' + TENNV as 'Ten Truong Phog', COUNT(MADA) á 'SoLuongDeAn'
		from PHONGBAN
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		inner join NHANVIEN on NHANVIEN.MANV = PHONGBAN.TRPHG
		where PHONGBAN.MAPHG = @MaPB
		group by TENPHG,TRPHG,TENNV,HONV,TENLOT
	return
end

select * from db.fn_SoLuongDeAnTheoPB(2)
select TENPHG,TRPHG,HONV+''+TENLOT+ ' ' + TENNV as 'Ten Truong Phog', COUNT(MADA) á 'SoLuongDeAn'
		from PHONGBAN
		inner join DEAN on DEAN.PHONG = PHONGBAN.MAPHG
		inner join NHANVIEN on NHANVIEN.MANV = PHONGBAN.TRPHG
		group by TENPHG,TRPHG,TENNV,HONV,TENLOT




--2.1

SELECT HONV, TENNV, TENPHG, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.PHG 

create view v_DD_PhongBan
as
select HONV, TENNV, DIADIEM from PHONGBAN
inner join DIADIEM_PHG on DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG
inner join NHANVIEN on NHANVIEN.PHG = PHONGBAN.MAPHG 
select * from v_DD_PhongBan 

--2.2

select TENNV,LUONG,YEAR(GETDATE())-YEAR(NGSINH) as 'Tuoi' from NHANVIEN

create view v_TuoiNV
as
select TENNV,LUONG,YEAR((GETDATE))-YEAR(NGSINH) as 'Tuoi' from NHANVIEN

select * from v_TuoiNV


--2.3

select top(1) TENPHG,TRPHG,B.HONV+' '+B.TENLOT+' '+B.TENNV as 'TENTP',COUNT(A.MANV) as 'SoLuongNV' from NHANVIEN
inner join PHONGBAN on PHONGBAN.MAPHG = A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG,B.TENNV,B.HONV,B.TENLOT 
orther by SoLuongNV desc

create view v_T?pLuongNV_PB
as
select top(1) TENPHG,TRPHG,B.HONV+' '+B.TENLOT+' '+B.TENNV as 'TENTP',COUNT(A.MANV) as 'SoLuongNV' from NHANVIEN A 
inner join PHONGBAN on PHONGBAN.MAPHG = A.PHG
inner join NHANVIEN B on B.MANV = PHONGBAN.TRPHG
group by TENPHG,TRPHG,B.TENNV,B.HONV,B.TENLOT 
orther by SoLuongNV desc

select * from v_TopSoLuongNV_PB