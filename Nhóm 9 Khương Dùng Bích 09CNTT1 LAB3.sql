﻿/**bài 1**/
SELECT THOIGIAN as tongthoigian,
CAST(THOIGIAN AS decimal(10,2))
  FROM PHANCONG
  
  GO
  SELECT THOIGIAN as tongthoigian,
  CONVERT(decimal(6,2),16)
  FROM PHANCONG
 
  go

  SELECT THOIGIAN,
  CAST(THOIGIAN AS VARCHAR)
  FROM PHANCONG
  
  GO
  SELECT THOIGIAN + CONVERT(VARCHAR,101)
  FROM PHANCONG
  GO
  select TENPHG,CAST(AVG(LUONG) AS decimal(10,2))AS LUONGTRUNGBINH
	from PHONGBAN,NHANVIEN
	where maphg=PHG
	group by TENPHG

	GO
	select TENPHG,LEFT(CAST(AVG(LUONG) AS VARCHAR),3)+ REPLACE(CAST(AVG(LUONG) AS VARCHAR),LEFT(CAST(AVG(LUONG) AS VARCHAR),3),',' ) AS LUONGTRUNGBINH
	from PHONGBAN,NHANVIEN
	where maphg=PHG
	group by TENPHG

	/**bài 2**/

	GO
	SELECT TENDEAN, CEILING(SUM(THOIGIAN))AS TONGTHOIGIAN
	FROM DEAN,PHANCONG, CONGVIEC
	WHERE DEAN.MADA=CONGVIEC.MADA AND CONGVIEC.MADA=PHANCONG.MADA
	GROUP BY TENDEAN
	GO
	SELECT TENDEAN, FLOOR(SUM(THOIGIAN))AS TONGTHOIGIAN
	FROM DEAN,PHANCONG, CONGVIEC
	WHERE DEAN.MADA=CONGVIEC.MADA AND CONGVIEC.MADA=PHANCONG.MADA
	GROUP BY TENDEAN
	GO
	SELECT TENDEAN, ROUND(SUM(THOIGIAN),2)AS TONGTHOIGIAN
	FROM DEAN,PHANCONG, CONGVIEC
	WHERE DEAN.MADA=CONGVIEC.MADA AND CONGVIEC.MADA=PHANCONG.MADA
	GROUP BY TENDEAN
	GO
	DECLARE @AVG_LUONG FLOAT
	SELECT @AVG_LUONG=AVG(LUONG)
	FROM NHANVIEN
	SELECT HONV,TENLOT,TENNV,ROUND(LUONG,2)
	FROM NHANVIEN
	WHERE LUONG>@AVG_LUONG AND PHG=5

/**bài 3**/
	GO
	SELECT UPPER(HONV),TENLOT,TENNV,DCHI
	FROM NHANVIEN,THANNHAN
	WHERE MA_NVIEN=MANV
	GROUP BY HONV,TENLOT,TENNV,DCHI
	HAVING COUNT(THANNHAN.MA_NVIEN)>2
	GO
	SELECT HONV,LOWER(TENLOT),TENNV,DCHI
	FROM NHANVIEN,THANNHAN
	WHERE MA_NVIEN=MANV
	GROUP BY HONV,TENLOT,TENNV,DCHI
	HAVING COUNT(THANNHAN.MA_NVIEN)>2
	GO
	 SELECT DCHI FROM NHANVIEN
  SELECT DCHI,CHARINDEX(' ',DCHI) FROM NHANVIEN
  SELECT DCHI, LEFT(DCHI,CHARINDEX(' ',DCHI)) AS 'SỐ NHÀ'FROM NHANVIEN
  /**bài 4**/
  GO
  SELECT HONV,TENLOT,TENNV
  FROM NHANVIEN
  where Year(NGSINH) Between 1960 and 1965
  GO
  SELECT HONV,TENLOT,TENNV,YEAR(GETDATE())-YEAR(NGSINH) AS TUOI
  FROM NHANVIEN
  GO
  SELECT TENPHG, CONVERT(VARCHAR, NG_NHANCHUC,105) AS 'NGAY SINH',HONV,TENLOT,TENNV,COUNT(*) NHANVIEN
  FROM PHONGBAN, NHANVIEN
  WHERE   MANV=TRPHG and MAPHG=PHG
  GROUP BY TENPHG,NG_NHANCHUC,HONV,TENLOT,TENNV
 

 
 
  


	

	


	
	
  