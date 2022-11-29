#LAB 6 BAI 3 
#CAU 1
create trigger trg_deleteNhanThanNV on NhanVien
instead of delete
as
begin
     delete from THANNHAN where MA_NVIEN in (select MANV from deleted)
	 delete from NHANVIEN where MANV in (select MANV from deleted)
end

delete NHANVIEN where MANV='001'
select * from NHANVIEN 

	 
#CAU 2
alter trigger trg_insertNhanVien3b on nhanvien
after insert
as begin
       insert into PHANCONG values((select MANV from inserted),1,1,100)
end

insert into NHANVIEN
values('Tran','Thanh','Huy','005','1980-12-12','Da Nang','N'Nữ',16000,'006',1)