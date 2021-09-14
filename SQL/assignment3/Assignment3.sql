USE	TestingSystem;

-- câu 2 : lấy ra tất cả thông tin phòng ban

SELECT *
FROM Department;

-- câu 3 : lấy ra id của phòng ban "Sale"

SELECT	departmentID
FROM	Department
WHERE	Department.departmentName='Sale';

-- câu 4 : lấy ra thông tin account có full name dài nhất

SELECT	full_name
FROM	`account`
WHERE	LENGTH(full_name)=(SELECT MAX(LENGTH(full_name))FROM `Account`)
ORDER BY full_name DESC;

-- câu 5 : Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT 		*,LENGTH(full_name) as a
FROM 		`Account`
WHERE 		departmentID='3'
ORDER BY	a DESC;

-- câu 6 : Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT	createDate
FROM	 `group`
Where	createDate<20-12-2019;

-- câu 7 : Lấy ra ID của question có >= 4 câu trả lời

SELECT	 questionID
FROM	 Answer
WHERE	 iscorrect >=4;

-- câu 8 : Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT	codes,duration,createDate
FROM	EXAM
WHERE 	duration >= 60 AND createDate < '2019-12-20';

-- câu 9 : Lấy ra 5 group được tạo gần đây nhất

SELECT	*
FROM		`group`
ORDER BY	createDate DESC
LIMIT 5;

-- câu 10 : Đếm số nhân viên thuộc department có id = 2

SELECT	count(*) as so_nhan_vien
FROM	`account`
WHERE departmentID=2;

-- câu 11 : Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT *
FROM	`Account`
WHERE  full_name LIKE 'V%n';

-- câu 12 : Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE FROM	EXAM
WHERE	createDate < '2019-12-20';

-- câu 13 : Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

DELETE	FROM	Question
WHERE	content	LIKE	'câu hỏi%';

-- câu 14 : Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn

UPDATE	`account`
SET		full_name ='Nguyễn Bá Lộc',email ='loc.nguyenba@vti.com.vn'
WHERE	accountID=5;

-- câu 15 : update account có id = 5 sẽ thuộc group có id = 4
UPDATE	groupaccount
SET		groupID=4
WHERE	accountID=5;

