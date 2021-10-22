
CREATE TABLE NHANVIEN
(
	MaNV nvarchar(10),
	HoNV nvarchar(20),
	TenlotNV nvarchar(15),
	TenNV nvarchar(15),
	NgSinh date,
	Dchi nvarchar(100),
	Phai nchar(5),
	Luong int,
	Phg int,
	MaNGS nvarchar(10),
	CONSTRAINT PK_NV primary key(MaNV)
)
GO
create table PHONGBAN
(
	MaPhg int,
	TenPhg nvarchar(10), 
	TrPhg nvarchar(10),
	NgNhanchuc date,
	primary key(MaPhg),
	CONSTRAINT FK_PB foreign key(TrPhg) references NHANVIEN(MaNV)
	on delete cascade
)
GO
drop table PHONGBAN
create table DEAN
(
	MaDA int,
	TenDA nvarchar(20),
	DdiemDA nvarchar(20),
	Phong int,
	CONSTRAINT PK_DA PRIMARY KEY(MaDA)

)
GO
create table PHANCONG
(
	MaNhanvien nvarchar(10),
	SoDA int,
	Thoigian float,
	foreign key(MaNhanvien) references NHANVIEN(MaNV)
	on delete cascade,
	foreign key(SoDA) references DEAN(MaDA)
)


go
create table DIADIEM_PHG
(
	MaPhong int,
	Diadiem nvarchar(20),
	CONSTRAINT FK_P foreign key(MaPhong) references PHONGBAN(MaPhg)
	on delete cascade
)
go
create table THANNHAN
(
	MaNVIEN nvarchar(10),
	TenTN nvarchar(100),
	Phai nchar(10),
	NgSinh date,
	Quanhe nvarchar(30),
	foreign key(MaNVIEN) references NHANVIEN(MaNV)
	on delete cascade
)


--phòng ban
insert PHONGBAN values ('5','Nghien cuu','333445555','1978/05/22')
insert PHONGBAN values ('4','Dieu hanh','987987987','1985/05/01')
insert PHONGBAN values ('1','Quan ly','888665555','1971/06/19')
--địa điểm phòng
insert DIADIEM_PHG values('1','TPHCM')
insert DIADIEM_PHG values('4','Ha Noi')
insert DIADIEM_PHG values('5','Vung Tau')
insert DIADIEM_PHG values('5','Nha Trang')
insert DIADIEM_PHG values('5','TPHCM')

--dữ liệu bảng thân nhân
insert THANNHAN values('333445555',N'Quang',N'Nu','1976/04/05','Contrai')
insert THANNHAN values('333445555',N'Khang',N'Nam','1973/10/25','Contrai')
insert THANNHAN values('333445555',N'Duong',N'Nu','1984/05/03','Vo chong')
insert THANNHAN values('987654321',N'Dang',N'Nam','1932/02/29','Vo chong')
insert THANNHAN values('123456789',N'Duy',N'Nam','1978/01/01','Contrai')
insert THANNHAN values('123456789',N'Chau',N'Nu','1978/12/31','Contrai')
insert THANNHAN values('123456789',N'Phuong',N'Nu','1957/05/05','Vo chong')
--bảng nhân viên
insert NHANVIEN values('123456789',N'Dinh','Ba','Tien','1955/01/09',N'731 Tran Hung Dao, Q.1, TPHCM','Nam','30000',5,'333445555')
insert NHANVIEN values('333445555',N'Nguyen','Thanh','Tung','1945/12/08',N'638 Nguyen Van Cu, Q.5, TPHCM','Nam','40000',5,'888665555')
insert NHANVIEN values('999887777',N'Bui','Thuy','Vu','1958/07/19',N'332 Nguyen Thai Hoc, Q.1, TPHCM','Nam','25000',4,'987654321')
insert NHANVIEN values('987654321',N'Le','Thi','Nhan','1931/06/20',N'291 Ho Van Hue, Q.PN, TPHCM','Nu','43000',4,'888665555')
insert NHANVIEN values('66688444',N'Nguyen','Manh','Hung','1952/09/15',N'975 Ba Ria Vung Tau','Nam','38000',5,'333445555')
insert NHANVIEN values('453453453',N'Tran','Thanh','Tam','1962/07/31',N'543 Mai Thi Luu, Q.1, TPHCM','Nam','25000',5,'333445555')
insert NHANVIEN values('987987987',N'Tran','Hong','Quang','1959/03/29',N'980 Le Hong Phong, Q.10, TPHCM','Nam','25000',4,'987654321')
insert NHANVIEN values('888665555',N'Vuong','Ngoc','Quyen','1927/10/10',N'450 Trung Vuong, Ha Noi','Nu','55000',1,'')

--nhập đề án
insert DeAn values('1', 'San pham X', 'Vung Tau', '5')
insert DeAn values('2', 'San pham Y', 'Nha Trang', '5')
insert DeAn values('3', 'San pham Z', 'Ha Noi', '4')
insert DeAn values('10', 'Tin hoc hoa', 'TPHCM', '1')
insert DeAn values('30', 'Cap quang', 'Ha Noi', '4')

--phân công
insert PHANCONG values('123456789','1','32.5')
insert PHANCONG values('123456789','2','7.5')
insert PHANCONG values('666884444','3','40.0')
insert PHANCONG values('453453453','1','20.0')
insert PHANCONG values('453453453','1','20.0')
insert PHANCONG values('333445555','1','10.0')
insert PHANCONG values('333445555','1','10.0')
insert PHANCONG values('333445555','1','10.0')
insert PHANCONG values('999887777','1','30.0')
insert PHANCONG values('999887777','1','10.0')
insert PHANCONG values('987987987','1','35.0')
insert PHANCONG values('987987987','1','5.0')

--L4. Tạo truy vấn bằng SQL
--TRUY VẤN ĐƠN GIẢN
--1. Tìm những nhân viên làm việc ở phòng số 4.
select *
from NHANVIEN
where NHANVIEN.Phg = 4

--2.Tìm những nhân viên có mức lương trên 30000.
select *
from NHANVIEN
where NHANVIEN.Luong > 30000

--3. Tìm những nhân viên có mức lương trên 25000 ở phòng số 4 hoặc các nhân viên có mức lương trên 30000 ở phòng số 5.
select *
from NHANVIEN
where ( NHANVIEN.Luong > 25000 and NHANVIEN.Phg = 4 ) or (NHANVIEN.Luong > 30000 and NHANVIEN.Phg = 5 )

--4. Cho biết họ tên đầy đủ của các nhân viên ở TPHCM.
select NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ và tên'
from NHANVIEN
where NHANVIEN.Dchi like '%TPHCM%'


--5.cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
select NHANVIEN.NgSinh, NHANVIEN.Dchi
from NHANVIEN
where NHANVIEN.HoNV='Dinh' and NHANVIEN.TenlotNV='Ba' and NHANVIEN.TenNV='Tien'

--Phép kết
--1. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng.
select PHONGBAN.TenPhg, DIADIEM_PHG.Diadiem
from PHONGBAN inner join DIADIEM_PHG
on PHONGBAN.MaPhg=DIADIEM_PHG.MaPhong
--2. Tìm tên những người trưởng phòng của từng phòng ban.
select NHANVIEN.TenNV, PHONGBAN.TenPhg
from NHANVIEN inner join PHONGBAN
on NHANVIEN.MaNV=PHONGBAN.TrPhg
--3.Tìm TenDA, MaDA, DdiemDA, Phong, TenPhg, MaPh, TrPhg, NgNhanchuc đề án, nhân viên, phòng ban, phân công
select DEAN.TenDA, DEAN.MaDA, DEAN.DdiemDA, DEAN.Phong, PHONGBAN.TenPhg, PHONGBAN.MaPhg,
PHONGBAN.TrPhg, PHONGBAN.NgNhanchuc
from DEAN,PHONGBAN
where DEAN.Phong = PHONGBAN.MaPhg

--4.--Tìm tên và địa chỉ của tất cả các nhân viên của phòng “Nghien cuu'
select NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ và tên', NHANVIEN.Dchi, PHONGBAN.TenPhg
from NHANVIEN inner join PHONGBAN
on NHANVIEN.Phg=PHONGBAN.MaPhg and PHONGBAN.TenPhg='Nghien cuu'

--5.Tìm tên những nữ nhân viên và tên người thân của họ.
select  NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ và tên', THANNHAN.TenTN
from NHANVIEN inner join THANNHAN
on NHANVIEN.Phai='Nu' and (NHANVIEN.MaNV = THANNHAN.MaNVIEN)
/*6. Với mọi đề án ở “Ha Noi”, liệt kê các mã số đế án (MaDA), mã số phòng
ban chủ trì đề án (Phong), họ tên trưởng phòng (HoNV, TenlotNV,
TenNV) cũng như địa chỉ (Dchi) và ngày sinh (NgSinh) của người ấy
*/
select DEAN.DdiemDA, DEAN.MaDA, DEAN.Phong,
 NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ và tên_TRphg',
 NHANVIEN.NgSinh, NHANVIEN.Dchi
from DEAN join PHONGBAN
	on DEAN.Phong = PHONGBAN.MaPhg
	join NHANVIEN on NHANVIEN.MaNV = PHONGBAN.TrPhg and DEAN.DdiemDA like '%Ha Noi%'
--7. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó.
select  NV1.HoNV +' '+ NV1.TenlotNV +' ' + NV1.TenNV as N'Họ và tên',
 NV2.HoNV +' '+ NV2.TenlotNV +' ' + NV2.TenNV as N'người quản lí'
from NHANVIEN as NV1 inner join NHANVIEN as NV2
	on NV1.MaNV = nv2.MaNGS
--8.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc.
select NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ và tên',
 NV.HoNV +' '+ NV.TenlotNV +' ' + nv.TenNV as N'trưởng phòng'
from NHANVIEN  join PHONGBAN
	on NHANVIEN.Phg = PHONGBAN.MaPhg
	join NHANVIEN as NV on NV.MaNV = PHONGBAN.TrPhg

--9. Tên những nhân viên phòng số 5 có tham gia vào đề án “San pham X” va những nhân viên này do “Nguyen Thanh Tung” quản lý trực tiếp
select *
from NHANVIEN join PHANCONG
	on NHANVIEN.MaNV = PHANCONG.MaNhanvien and NHANVIEN.Phg = 5
	join DEAN on DEAN.MaDA = PHANCONG.SoDA and DEAN.TenDA = 'San pham X'
	join NHANVIEN as NV on NHANVIEN.MaNGS = NV.MaNV and  NV.HoNV ='Nguyen' and NV.TenlotNV ='Thanh'and NV.TenNV='Tung'

--10. Cho biết họ tên nhân viên (HoNV, TenlotNV, TenNV) và tên các đề án mà nhân viên đó tham gia nếu có.
select NHANVIEN.HoNV +' '+ NHANVIEN.TenlotNV +' ' + NHANVIEN.TenNV as N'Họ tên', DEAN.TenDA
from NHANVIEN join PHONGBAN 
	on NHANVIEN.Phg = PHONGBAN.MaPhg
	join DEAN on DEAN.Phong = PHONGBAN.MaPhg
-- Gom nhóm
--1. Với mỗi đề án, liệt kê tên đề án, và tổng số giờ làm việc một tuần của tất cả các nhân viên tham gia đề án đó.
select DEAN.TenDA, sum(PHANCONG.Thoigian)
from DEAN, PHANCONG
where DEAN.MaDA = PHANCONG.SoDA
group by DEAN.TenDA

--2. Với mỗi nhân viên, cho biết họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân
select NHANVIEN.MaNV , COUNT(THANNHAN.MaNVIEN)
from NHANVIEN left join THANNHAN
	on NHANVIEN.MaNV = THANNHAN.MaNVIEN
group by NHANVIEN.MaNV

--3. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó
select PHONGBAN.TenPhg, AVG(NHANVIEN.Luong) as N'Lương tb'
from PHONGBAN left join NHANVIEN
	on PHONGBAN.MaPhg=NHANVIEN.Phg
group by PHONGBAN.TenPhg
--4. lương trung bình của nhân viên nữ
select AVG(NHANVIEN.Luong) as N'lương tb của nv nữ'
from NHANVIEN
where NHANVIEN.Phai ='Nu'
group by NHANVIEN.Phai

--5.Với các phòng ban có mức lương trung bình trên 30000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select PHONGBAN.TenPhg, COUNT(*) as 'so luong NV', AVG(NHANVIEN.Luong) as 'luong'
from NHANVIEN join PHONGBAN
	on NHANVIEN.Phg	= PHONGBAN.MaPhg
group by PHONGBAN.TenPhg
having AVG(NHANVIEN.Luong) > 30000
--TRUY VẤN LỒNG
--1. Cho biết danh sách các đề án (MaDA) có nhân viên với họ là Dinh hoặc có người trưởng phòng chủ trì đề án với họ là Dinh
select DEAN.MaDA, DEAN.TenDA
from NHANVIEN, PHANCONG, DEAN
where NHANVIEN.MaNV = PHANCONG.MaNhanvien and
	PHANCONG.SoDA = DEAN.MaDA and
	NHANVIEN.HoNV = 'Nguyen'
union
select DEAN.MaDA, DEAN.TenDA
from PHONGBAN , DEAN, NHANVIEN
where PHONGBAN.TrPhg = NHANVIEN.MaNV and
	PHONGBAN.MaPhg = DEAN.Phong
	and NHANVIEN.HoNV = 'Nguyen'

--TỔNG HỢP
--1. Cho biết họ tên và địa chỉ của các nhân viên sống ở TPHCM, sắp xếp tăng dần theo tên, lót, họ
select *
from NHANVIEN
where NHANVIEN.Dchi like '%TPHCM%'
order by NHANVIEN.TenNV, NHANVIEN.TenlotNV, NHANVIEN.HoNV asc
--2. Cho biết họ tên và mức lương các nhân viên trên 40 tuổi, sắp xếp tăng dần theo lương
select  NHANVIEN.HoNV+' '+ NHANVIEN.TenlotNV+' '+ NHANVIEN.TenNV as N'Họ và tên', NHANVIEN.Luong
from NHANVIEN
where YEAR(getdate()) - year(NHANVIEN.NgSinh) > 40
order by NHANVIEN.Luong asc

--3.Liệt kê danh sách những nhân viên (tên đầy đủ) có cùng tên với người thân
select NHANVIEN.HoNV+' '+ NHANVIEN.TenlotNV+' '+ NHANVIEN.TenNV as N'Họ và tên', THANNHAN.TenTN as N'Tên người thân'
from NHANVIEN left join THANNHAN
on NHANVIEN.MaNV = THANNHAN.MaNVIEN

--4. Cho biết tên những nhân viên phòng số 5 có tham gia đề án “San pham X” với số giờ làm việc trên 10 giờ/tuần
select NHANVIEN.MaNV
from NHANVIEN join PHANCONG
	on NHANVIEN.MaNV = PHANCONG.MaNhanvien and PHANCONG.Thoigian > 10
	join DEAN on NHANVIEN.Phg = DEAN.Phong and NHANVIEN.Phg = 5
group by NHANVIEN.MaNV

--5. Cho biết danh sách những nhân viên (tên đầy đủ) không có thân nhân nào.
select NHANVIEN.HoNV+' '+ NHANVIEN.TenlotNV+' '+ NHANVIEN.TenNV as N'Họ và tên'
from NHANVIEN
where NHANVIEN.MaNV not in 
(
select NHANVIEN.MaNV
from NHANVIEN join THANNHAN
	on NHANVIEN.MaNV = THANNHAN.MaNVIEN
)
--6. Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.
select NHANVIEN.*
from NHANVIEN join THANNHAN
	on NHANVIEN.MaNV = THANNHAN.MaNVIEN
where NHANVIEN.MaNV in
(
select NHANVIEN.MaNV
from NHANVIEN join PHONGBAN
	on NHANVIEN.MaNV = PHONGBAN.TrPhg
)

--7.Cho biết danh sách những nhân viên (tên đầy đủ) không làm việc cho bất cứ đề án nào
select NHANVIEN.*
from NHANVIEN
where NHANVIEN.MaNV NOT IN 
(
select NHANVIEN.MaNV
from NHANVIEN , PHANCONG
where NHANVIEN.MaNV = PHANCONG.MaNhanvien
)

--8. Cho biết danh sách những nhân viên (tên đầy đủ) có trên 2 thân nhân.
select NHANVIEN.*
from NHANVIEN
where (
	select COUNT(*)
	from THANNHAN
	where NHANVIEN.MaNV = THANNHAN.MaNVIEN ) >2

/*9. Tìm tên đầy đủ và địa chỉ của những nhân viên làm việc cho một đề án ở
TPHCM nhưng phòng ban mà họ trực thuộc tất cả không tọa lạc ở
TPHCM*/

--10.Tăng mức lương lên 10% cho những nhân viên có thân nhân.
update NHANVIEN
set Luong = luong + (luong*10 /100)
where NHANVIEN.MaNV IN
(
	select NHANVIEN.MaNV
	from NHANVIEN inner join THANNHAN
	on NHANVIEN.MaNV = THANNHAN.MaNVIEN	
)
/*11. Tăng mức lương thêm 20% cho những nhân viên là trưởng phòng và đồng 
thời có thân nhân.*/
update NHANVIEN
set Luong = Luong + Luong*10/100
where NHANVIEN.MaNV IN
(
select distinct NHANVIEN.MaNV
from NHANVIEN inner join PHONGBAN
	on NHANVIEN.MaNV = PHONGBAN.TrPhg
	inner join THANNHAN on NHANVIEN.MaNV = THANNHAN.MaNVIEN
)
--nháp
select NHANVIEN.*
from NHANVIEN inner join PHONGBAN
	on NHANVIEN.MaNV = PHONGBAN.TrPhg

select NHANVIEN.*
from  NHANVIEN inner join THANNHAN
	 on NHANVIEN.MaNV = THANNHAN.MaNVIEN
	

--12. Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.
update NHANVIEN
set Luong = Luong + Luong*30/100
(
select NHANVIEN.MaNV
from NHANVIEN
where YEAR(getdate()) - YEAR(NHANVIEN.NgSinh) > 50
)
--13. Xóa những nhân viên ra khỏi danh sách nếu là phải nam trên 60 tuổi
DELETE from NHANVIEN
where NHANVIEN.Phai ='Nam' and (YEAR(GETDATE()) - YEAR(NHANVIEN.NgSinh) >60 )
 
--14.Hãy cập nhật lại địa điểm làm đề án và địa điểm phòng là cùng một nơi


--15.loại bỏ những đề án có time làm việc trên 30h/tuần
delete from PHANCONG
where PHANCONG.Thoigian >30
--16 Hãy cập nhật lại những đề án có thời gian làm việc chưa xác định thành có
--thời gian mặc định là 5 giờ/tuần
update PHANCONG
set Thoigian = 5
where PHANCONG.Thoigian = NULL
--17.Cho biết phòng ban, họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
--temp1 la bangr chứa số nhân viên của các phòng
create view temp1 as
(
select  NHANVIEN.Phg , COUNT(NHANVIEN.MaNV) as 'soluong'
from NHANVIEN
group by NHANVIEN.Phg
)

--thông tin trưởng phòng của phòng có nhân viên nhiều nhất
select NHANVIEN.*
from NHANVIEN, PHONGBAN
where NHANVIEN.Phg =
(
	--chọn ra phòng có số nhân viên nhiên nhất
	select temp1.Phg
	from temp1
	where temp1.soluong =
	(
		select max(soluong)
		from temp1
	)
) and NHANVIEN.MaNV = PHONGBAN.TrPhg
--18. Cho biết danh sách các nhân viên và tên các phòng ban mà họ phụ trách nếu có.
select NHANVIEN.*
from NHANVIEN join PHONGBAN
	on PHONGBAN.TrPhg = NHANVIEN.MaNV
--19. Cho biết 3 nhân viên lớn tuổi nhất công ty
select top(3) NHANVIEN.* , YEAR(getdate()) - YEAR(NHANVIEN.NgSinh) as Tuoi
from NHANVIEN
order by YEAR(getdate()) - YEAR(NHANVIEN.NgSinh) desc
--20. Cho biết danh sách những nhân viên (tên đầy đủ) làm việc trong mọi đề án
select NHANVIEN.*
from NHANVIEN, PHANCONG
where NHANVIEN.MaNV = PHANCONG.MaNhanvien
and PHANCONG.SoDA in (
	select DEAN.MaDA
	from DEAN
)

--CÀI ĐẶT RÀNG BUỘC TOÀN VẸN
--1.đã cài đặt ở trong lúc tạo bảng
--2Tạo các ràng buộc trên table NHANVIEN để những nhân viên vào làm việc phải có tuổi trên 18.
alter table NHANVIEN
	add constraint tuoi check(year(getdate()) - year(NHANVIEN.NgSinh) > 18)

/*3Tạo ràng buộc trên table PHONGBAN để ngày nhận chức trưởng phòng của nhân 
viên không nhỏ hơn ngày sinh của người ấy*/
create function check_nvpb() returns int
as
begin
	return (select COUNT(NHANVIEN.MaNV)
			FROM NHANVIEN, PHONGBAN
			WHERE NHANVIEN.MaNV = PHONGBAN.TrPhg and 
			NHANVIEN.NgSinh > PHONGBAN.NgNhanchuc
			)
end

alter table NHANVIEN
add constraint Rnv check (check_nvpb() < 1)

alter table PHONGBAN
add constraint Rpb check( check_nvpb() < 1)
/*
4.Tạo ràng buộc trên bảng DEAN trên cột DdiemDA chỉ thuộc các khu vực trong 
phạm vi cho trước.*/
ALTER TABLE DEAN
ADD CONSTRAINT DiaDiem 
 CHECK (DEAN.DdiemDA IN ('Nha Trang', 'Ha Noi', 'Vung Tau','TPHCM'))
 
--5. Tạo ràng buộc trên table DIADIEM_PHG trên cột Diadiem chi thuộc các khu vực trong phạm vi cho trước.
alter table DIADIEM_PHG
add constraint diadiemPHG 
	check (DIADIEM_PHG.Diadiem in ('Nha Trang', 'Ha Noi', 'Vung Tau','TPHCM'))
/*
6. Tạo ràng buộc trên table THANNHAN để nếu một thân nhân là con của nhân 
viên thì có ngày sinh nhỏ hơn ngày sinh của nhân viên, đồng thời nếu là con trai 
thì phái là “Nam” và con gái thì phái là “Nữ”.*/








