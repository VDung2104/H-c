/*Bai 2*/
create trigger trg_insert_Nhanvien2a on Nhanvien
after insert 
as 
	begin 
		select count(case when upper (PHAI)=N'Nam' the 1 end ) Nam,
		count(case when upper(PHAI)=N'Nu' then 1 end 1 end) Nu
		from NHANVIEN
	end

insert into NHANVIEN values('tong','phuoc','quan','021','01-09-1975',,
'275BD','Nam',16000,'005',1

select * from NHANVIEN

/*---------------------------------------*/
create trigger trg_insert_Dean2c on Dean
after delete
as
	begin
		select ma_nvvien, count(mada) as 'so luong du an' from PHANCONG group by MA_NVIEN
	end 
select*from PHANCONG 
select*from dean
insert into dean values('SQL Server',40,'BD',4)
delete from dean where mada=40

