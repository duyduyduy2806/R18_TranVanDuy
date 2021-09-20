DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;

USE ThucTap;

DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien(
	magv		TINYINT	UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten		VARCHAR(50) NOT NULL,
	luong		INT NOT NULL
);
		
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien(
	masv		TINYINT	UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten		VARCHAR(50) NOT NULL,
    namsinh		DATETIME,
	quequan		VARCHAR(100)
);


DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai(
	madt		TINYINT	UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tendt		VARCHAR(100) NOT NULL UNIQUE KEY,
	kinhphi		INT NOT NULL,
    NoiThucTap	VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan(
	id			TINYINT	UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    masv		TINYINT	UNSIGNED NOT NULL,
	madt		TINYINT	UNSIGNED NOT NULL,
    magv		TINYINT	UNSIGNED NOT NULL,
    ketqua		VARCHAR(50) NOT NULL,
    FOREIGN KEY (masv) REFERENCES SinhVien(masv),
    FOREIGN KEY (madt) REFERENCES DeTai(madt),
    FOREIGN KEY (magv) REFERENCES GiangVien(magv)
);


-- Questions 1. Tạo table với các ràng buộc và kiểu dữ liệu

INSERT	INTO	GiangVien	(hoten				,luong)
VALUES						('PHAM VAN QUA' 	, 3000),
							('NGUYEN HOAI ANH' 	, 2000),
                            ('TRAN THI TRANG' 	, 1000);
                            
INSERT	INTO	SinhVien	(hoten				,namsinh		,quequan)
VALUES						('TRAN VAN DUY' 	,	'1998-06-28'	, 'NAM DINH'),
							('TRAN VAN KHANH' 	,	'1999-07-22'	, 'HA NOI'	),
                            ('TRAN VAN QUAN' 	, 	'1999-04-21'	,'HAI PHONG');
                            
INSERT	INTO	DeTai	(tendt						,kinhphi	,NoiThucTap)
VALUES						('TIM KIEM THIEN TAI' 		,	5000	,'THIEN TAI LA Gi'),
							('CHIEN LUOC COVID' 		, 	10000	,'TAI SAO CO COVID'),
                            ('TIM HIEU NOI DUNG HOC' 	, 	15000	,'HOC TAP HIEU QUA');                            

INSERT	INTO	HuongDan	(masv	,madt,magv	,ketqua			)
VALUES						(1		,2	,1		,'TOT'			),
							(2		,3	,2		,'TRUNG BINH'	),
                            (3 		,1	,1		,'KEM'			);

-- 2. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn

SELECT	SinhVien.hoten, DeTai.tendt
FROM	HuongDan
JOIN SinhVien ON SinhVien.masv = HuongDan.masv
JOIN DeTai ON DeTai.madt = HuongDan.madt
WHERE DeTai.tendt IS NULL
GROUP BY SinhVien.hoten;

-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’

SELECT	SinhVien.hoten
FROM	HuongDan
JOIN	SinhVien	ON	SinhVien.masv=HuongDan.masv
JOIN	DeTai		ON	DeTai.madt=HuongDan.madt
WHERE	DeTai.tendt='CONG NGHE SINH HOC';

-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")

DROP VIEW IF EXISTS SinhVienInfo;
CREATE VIEW SinhVienInfo as
	SELECT	SinhVien.masv,SinhVien.hoten,DeTai.tendt
    FROM 	HuongDan
    JOIN	SinhVien	ON	SinhVien.masv=HuongDan.masv
	JOIN	DeTai		ON	DeTai.madt=HuongDan.madt
	WHERE	DeTai.tendt IS NULL;
    
    
SELECT * FROM SinhVienInfo;

-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900
-- thì hiện ra thông báo "năm sinh phải > 1900"

INSERT	INTO	SinhVien	(hoten				,namsinh		,quequan)
VALUES						('HOA HOA HOA' 	,	'1899-06-28'	, 'HAI DUONG');

DROP TRIGGER IF EXISTS TENSINHVIEN;
DELIMITER $$
CREATE TRIGGER TENSINHVIEN
BEFORE INSERT ON SinhVien
FOR EACH ROW
BEGIN
		IF NEW.masv = ( SELECT masv FROM SinhVien WHERE namsinh <= '1900') THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = "năm sinh phải > 1900";
        END IF ; 
END $$
DELIMITER ;

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi

DELETE
FROM SinhVien
WHERE masv=1;

DROP TRIGGER IF EXISTS UPDATE_TABLE;
DELIMITER $$
CREATE TRIGGER UPDATE_TABLE
BEFORE DELETE ON HuongDan
FOR EACH ROW
BEGIN
	DELETE
    FROM	HuongDan
    WHERE	masv=OLD.masv;
    END $$
DELIMITER ;