CREATE TABLE CAUTHU (
  MACT NUMERIC GENERATED AS IDENTITY PRIMARY KEY,
  HOTEN NVARCHAR2(100) NOT NULL,
  VITRI NVARCHAR2(20) NOT NULL,
  NGAYSINH DATE,
  DIACHI NVARCHAR2(200),
  MACLB VARCHAR2(5) NOT NULL,
  MAQG VARCHAR2(5) NOT NULL,
  SO INT NOT NULL
);

CREATE TABLE QUOCGIA (
  MAQG VARCHAR2(5) PRIMARY KEY,
  TENQG NVARCHAR2(60) NOT NULL
);

CREATE TABLE CAULACBO (
  MACLB VARCHAR2(5) PRIMARY KEY,
  TENCLB NVARCHAR2(100) NOT NULL,
  MASAN VARCHAR2(5) NOT NULL,
  MATINH VARCHAR2(5) NOT NULL
);

CREATE TABLE TINH (
  MATINH VARCHAR2(5) PRIMARY KEY,
  TENTINH NVARCHAR2(100) NOT NULL
);

CREATE TABLE SANVD (
  MASAN VARCHAR2(5) PRIMARY KEY,
  TENSAN NVARCHAR2(100) NOT NULL,
  DIACHI NVARCHAR2(200)
);

CREATE TABLE HUANLUYENVIEN (
  MAHLV VARCHAR2(5) PRIMARY KEY,
  TENHLV NVARCHAR2(100) NOT NULL,
  NGAYSINH DATE,
  DIACHI NVARCHAR2(200),
  DIENTHOAI NVARCHAR2(20),
  MAQG VARCHAR2(5) NOT NULL
);

CREATE TABLE HLV_CLB (
  MAHLV VARCHAR2(5),
  MACLB VARCHAR2(5),
  VAITRO NVARCHAR2(100) NOT NULL,
  PRIMARY KEY (MAHLV, MACLB)
);

CREATE TABLE TRANDAU (
  MATRAN NUMERIC GENERATED AS IDENTITY PRIMARY KEY,
  NAM INT NOT NULL,
  VONG INT NOT NULL,
  NGAYTD DATE NOT NULL,
  MACLB1 VARCHAR2(5) NOT NULL,
  MACLB2 VARCHAR2(5) NOT NULL,
  MASAN VARCHAR2(5) NOT NULL,
  KETQUA VARCHAR2(5) NOT NULL
);

CREATE TABLE BANGXH (
  MACLB VARCHAR2(5),
  NAM INT,
  VONG INT,
  SOTRAN INT NOT NULL,
  THANG INT NOT NULL,
  HOA INT NOT NULL,
  THUA INT NOT NULL,
  HIEUSO VARCHAR2(5) NOT NULL,
  DIEM INT NOT NULL,
  HANG INT NOT NULL,
  PRIMARY KEY (MACLB, NAM, VONG)
);

ALTER TABLE TRANDAU ADD FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN);
ALTER TABLE TRANDAU ADD FOREIGN KEY (MACLB1) REFERENCES CAULACBO(MACLB);
ALTER TABLE TRANDAU ADD FOREIGN KEY (MACLB2) REFERENCES CAULACBO(MACLB);

ALTER TABLE BANGXH ADD FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB);

ALTER TABLE CAUTHU ADD FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB);
ALTER TABLE CAUTHU ADD FOREIGN KEY (MAQG) REFERENCES QUOCGIA(MAQG);

ALTER TABLE HLV_CLB ADD FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB);
ALTER TABLE HLV_CLB ADD FOREIGN KEY (MAHLV) REFERENCES HUANLUYENVIEN(MAHLV);

ALTER TABLE HUANLUYENVIEN ADD FOREIGN KEY (MAQG) REFERENCES QUOCGIA(MAQG);

ALTER TABLE CAULACBO ADD FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN);
ALTER TABLE CAULACBO ADD FOREIGN KEY (MATINH) REFERENCES TINH(MATINH);

INSERT ALL
INTO CAUTHU VALUES (1, 'Nguyễn Vũ Phong', 'Tiền Vệ', '20-Feb-1990', NULL, 'BBD', 'VN', 17)
INTO CAUTHU VALUES (2, 'Nguyễn Công Vinh', 'Tiền đạo', '10-Mar-1992', NULL, 'HAGL', 'VN', 9)
INTO CAUTHU VALUES (4, 'Trần Tấn Tài', 'Tiền vệ', '12-Nov-1989', NULL, 'BBD', 'VN', 8)
INTO CAUTHU VALUES (5, 'Phan Hồng Sơn', 'Thủ môn', '10-Jun-1991', NULL, 'HAGL', 'VN', 1)
INTO CAUTHU VALUES (6, 'Ronaldo', 'Tiền vệ', '12-Dec-1989', NULL, 'SDN', 'BRA', 7)
INTO CAUTHU VALUES (7, 'Robinho', 'Tiền vệ', '12-Oct-1989', NULL, 'SDN', 'BRA', 8)
INTO CAUTHU VALUES (8, 'Vidic', 'Hậu vệ', '15-Oct-1987', NULL, 'HAGL', 'ANH', 3)
INTO CAUTHU VALUES (9, 'Trần Văn Santos', 'Thủ môn', '21-Oct-1990', NULL, 'BBD', 'BRA', 1)
INTO CAUTHU VALUES (10, 'Nguyễn Trường Sơn', 'Hậu vệ', '26-Aug-1993', NULL, 'BBD', 'VN', 4)
SELECT 1 FROM DUAL;


INSERT ALL
INTO QUOCGIA VALUES ('VN', 'Việt Nam')
INTO QUOCGIA VALUES ('ANH', 'Anh Quốc')
INTO QUOCGIA VALUES ('TBN', 'Tây Ban Nha')
INTO QUOCGIA VALUES ('BDN', 'Bồ Đào Nha')
INTO QUOCGIA VALUES ('BRA', 'Bra-xin')
INTO QUOCGIA VALUES ('ITA', 'Ý')
INTO QUOCGIA VALUES ('THA', 'Thái Lan')
SELECT 1 FROM DUAL;

INSERT ALL
INTO TINH VALUES ('BD', 'Bình Dương')
INTO TINH VALUES ('GL', 'Gia Lai')
INTO TINH VALUES ('DN', 'Đà Nẵng')
INTO TINH VALUES ('KH', 'Khánh Hòa')
INTO TINH VALUES ('PY', 'Phú Yên')
INTO TINH VALUES ('LA', 'Long An')
SELECT 1 FROM DUAL;

INSERT ALL
INTO SANVD VALUES ('GD', 'Gò Đậu', '123 QL 1, TX Thủ Dầu Một, Bình Dương')
INTO SANVD VALUES ('PL', 'Pleiku', '22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai')
INTO SANVD VALUES ('CL', 'Chi Lăng', '127 Võ Văn Tần, Đà Nẵng')
INTO SANVD VALUES ('NT', 'Nha Trang', '128 Phan Chu Trinh, Nha Trang, Khánh Hòa')
INTO SANVD VALUES ('TH', 'Tuy Hòa', '57 Trường Trinh, Tuy Hòa, Phú Yên')
INTO SANVD VALUES ('LA', 'Long An', '102 Hùng Vương, Tp Tân An, Long An')
SELECT 1 FROM DUAL;

INSERT ALL
INTO HUANLUYENVIEN VALUES ('HLV01', 'Vital', '15-Oct-1955', NULL, '0918011075', 'BDN')
INTO HUANLUYENVIEN VALUES ('HLV02', 'Lê Huỳnh Đức', '20-May-1972', NULL, '01223456789', 'VN')
INTO HUANLUYENVIEN VALUES ('HLV03', 'Kiatisuk', '11-Dec-1970', NULL, '01990123456', 'THA')
INTO HUANLUYENVIEN VALUES ('HLV04', 'Hoàng Anh Tuấn', '10-Jun-1970', NULL, '0989112233', 'VN')
INTO HUANLUYENVIEN VALUES ('HLV05', 'Trần Công Minh', '07-Jul-1973', NULL, '0909099990', 'VN')
INTO HUANLUYENVIEN VALUES ('HLV06', 'Trần Văn Phúc', '02-Mar-1965', NULL, '001650101234', 'VN')
SELECT 1 FROM DUAL;

INSERT ALL
INTO CAULACBO VALUES ('BBD', 'BECAMEX BÌNH DƯƠNG', 'GD', 'BD')
INTO CAULACBO VALUES ('HAGL', 'HOÀNG ANH GIA LAI', 'PL', 'GL')
INTO CAULACBO VALUES ('SDN', 'SHB ĐÀ NẴNG', 'CL', 'DN')
INTO CAULACBO VALUES ('KKH', 'KHATOCO KHÁNH HÒA', 'NT', 'KH')
INTO CAULACBO VALUES ('TPY', 'THÉP PHÚ YÊN', 'TH', 'PY')
INTO CAULACBO VALUES ('GDT', 'GẠCH ĐỒNG TÂM LONG AN', 'LA', 'LA')
SELECT 1 FROM DUAL;

INSERT ALL
INTO HLV_CLB VALUES ('HLV01', 'BBD', 'HLV Chính')
INTO HLV_CLB VALUES ('HLV02', 'SDN', 'HLV Chính')
INTO HLV_CLB VALUES ('HLV03', 'HAGL', 'HLV Chính')
INTO HLV_CLB VALUES ('HLV04', 'KKH', 'HLV Chính')
INTO HLV_CLB VALUES ('HLV05', 'GDT', 'HLV Chính')
INTO HLV_CLB VALUES ('HLV06', 'BBD', 'HLV thủ môn')
SELECT 1 FROM DUAL;

INSERT ALL
INTO BANGXH VALUES ('BBD', 2009, 1, 1, 1, 0, 0, '3-0', 3, 1)
INTO BANGXH VALUES ('KKH', 2009, 1, 1, 0, 1, 0, '1-1', 1, 2)
INTO BANGXH VALUES ('GDT', 2009, 1, 1, 0, 1, 0, '1-1', 1, 3)
INTO BANGXH VALUES ('TPY', 2009, 1, 0, 0, 0, 0, '0-0', 0, 4)
INTO BANGXH VALUES ('SDN', 2009, 1, 1, 0, 0, 1, '0-3', 0, 5)
INTO BANGXH VALUES ('TPY', 2009, 2, 1, 1, 0, 0, '5-0', 3, 1)
INTO BANGXH VALUES ('BBD', 2009, 2, 2, 1, 0, 1, '3-5', 3, 2)
INTO BANGXH VALUES ('KKH', 2009, 2, 2, 0, 2, 0, '3-3', 2, 3)
INTO BANGXH VALUES ('GDT', 2009, 2, 1, 0, 1, 0, '1-1', 1, 4)
INTO BANGXH VALUES ('SDN', 2009, 2, 2, 1, 1, 0, '2-5', 1, 5)
INTO BANGXH VALUES ('BBD', 2009, 3, 3, 2, 0, 1, '4-5', 6, 1)
INTO BANGXH VALUES ('GDT', 2009, 3, 2, 1, 1, 0, '3-1', 4, 2)
INTO BANGXH VALUES ('TPY', 2009, 3, 2, 1, 0, 1, '5-2', 3, 3)
INTO BANGXH VALUES ('KKH', 2009, 3, 3, 0, 2, 1, '3-4', 2, 4)
INTO BANGXH VALUES ('SDN', 2009, 3, 2, 1, 1, 0, '2-5', 1, 5)
INTO BANGXH VALUES ('BBD', 2009, 4, 4, 2, 1, 1, '6-7', 7, 1)
INTO BANGXH VALUES ('GDT', 2009, 4, 3, 1, 2, 0, '5-1', 5, 2)
INTO BANGXH VALUES ('KKH', 2009, 4, 4, 1, 2, 1, '4-4', 5, 3)
INTO BANGXH VALUES ('TPY', 2009, 4, 3, 1, 0, 2, '5-3', 3, 4)
INTO BANGXH VALUES ('SDN', 2009, 4, 2, 1, 1, 0, '2-5', 1, 5)
SELECT 1 FROM DUAL;

INSERT ALL
INTO TRANDAU VALUES (1, 2009, 1, '07-Feb-2009', 'BBD', 'SDN', 'GD', '3-0')
INTO TRANDAU VALUES (2, 2009, 1, '07-Feb-2009', 'KKH', 'GDT', 'NT', '1-1')
INTO TRANDAU VALUES (3, 2009, 2, '16-Feb-2009', 'SDN', 'KKH', 'CL', '2-2')
INTO TRANDAU VALUES (4, 2009, 2, '16-Feb-2009', 'TPY', 'BBD', 'TH', '5-0')
INTO TRANDAU VALUES (5, 2009, 3, '01-Mar-2009', 'TPY', 'GDT', 'TH', '0-2')
INTO TRANDAU VALUES (6, 2009, 3, '01-Mar-2009', 'KKH', 'BBD', 'NT', '0-1')
INTO TRANDAU VALUES (7, 2009, 4, '07-Mar-2009', 'KKH', 'TPY', 'NT', '1-0')
INTO TRANDAU VALUES (8, 2009, 4, '07-Mar-2009', 'BBD', 'GDT', 'GD', '2-2')
SELECT 1 FROM DUAL;

SELECT MACT, HOTEN, SO, VITRI, NGAYSINH, DIACHI
FROM CAUTHU;

SELECT *
FROM CAUTHU
WHERE SO = 7 AND VITRI = 'Tiền vệ';

SELECT TENHLV, NGAYSINH, DIACHI, DIENTHOAI
FROM HUANLUYENVIEN;

SELECT *
FROM CAUTHU
WHERE MAQG = 'VN' AND MACLB = 'BBD';

SELECT MACT, HOTEN, NGAYSINH, DIACHI, VITRI
FROM CAUTHU
WHERE MACLB = 'SDN' AND MAQG = 'BRA';


