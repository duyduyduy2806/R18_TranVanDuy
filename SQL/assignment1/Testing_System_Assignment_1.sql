DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;

USE TestingSystem;

-- Thêm bảng Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	departmentID	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    departmentName	VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Thêm bảng Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	positionID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    positionName	VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Thêm bảng Accounts
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	accountID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 				VARCHAR(50) NOT NULL UNIQUE KEY,
    username			VARCHAR(50) NOT NULL ,
    full_name			VARCHAR(50) NOT NULL UNIQUE KEY,
    departmentID		TINYINT UNSIGNED NOT NULL,
    positionID 			TINYINT UNSIGNED NOT NULL,
    createDate			DATETIME DEFAULT now(),
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID),
    FOREIGN KEY (positionID) REFERENCES `Position` (positionID)
);

-- Thêm bảng Group
DROP TABLE IF EXISTS `Group`;   
CREATE TABLE `Group`(
	groupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    groupName			VARCHAR(50) NOT NULL UNIQUE KEY,
    creatorID			TINYINT UNSIGNED,
    createDate			DATETIME DEFAULT now(),
    FOREIGN KEY (creatorID) REFERENCES `Account`(accountID)
);
-- Thêm bảng GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	groupID				TINYINT UNSIGNED ,
    accountID			TINYINT UNSIGNED,
    joinDate			DATETIME DEFAULT NOW() ,
    FOREIGN KEY (groupID) REFERENCES `Group`(groupID),
    FOREIGN KEY (accountID) REFERENCES `Account`(accountID),
	PRIMARY KEY	(groupID,accountID)
);

-- Thêm bảng TypeQuestion
DROP TABLE IF EXISTS Typequestion;
CREATE TABLE Typequestion(
	typeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    typeName			VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Thêm bảng CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	categoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	categoryName		VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Thêm bảng Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	questionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(100) NOT NULL,
    categoryID			TINYINT UNSIGNED NOT NULL,
    typeID				TINYINT UNSIGNED NOT NULL,
    creatorID			TINYINT UNSIGNED NOT NULL,
    createDate			DATETIME DEFAULT NOW() ,
    FOREIGN KEY (categoryID) REFERENCES Categoryquestion(categoryID),
    FOREIGN KEY (typeID) REFERENCES Typequestion(typeID)
);

-- Thêm bảng Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	answerID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(100),
    questionID			TINYINT UNSIGNED NOT NULL,
    iscorrect			ENUM('T','F'),
    FOREIGN KEY (questionID) REFERENCES Question(questionID)
);

-- Thêm bảng Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	examID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Codes				SMALLINT UNSIGNED NOT NULL UNIQUE KEY,
    title				VARCHAR(100) NOT NULL,
    categoryID			TINYINT UNSIGNED NOT NULL,
    duration			SMALLINT UNSIGNED NOT NULL,
    creatorID			TINYINT UNSIGNED NOT NULL,
    createDate			DATETIME DEFAULT NOW() ,
    FOREIGN KEY (categoryID) REFERENCES Categoryquestion(categoryID)
);

-- Thêm bảng Exists
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	examID			TINYINT UNSIGNED,
    questionID		TINYINT UNSIGNED,
    FOREIGN KEY (examID)  REFERENCES Exam(examID),
	FOREIGN KEY (questionID) REFERENCES Question(questionID),
	PRIMARY KEY (examID, questionID)
);


-- thêm ít nhất 10 records vào mỗi bảng
INSERT INTO Department(	departmentName)
VALUES                (	'Sale'		),
					  ( 'Marketing'),
                      (	'Bảo vệ'),
                      (	'Nhân Sự'),
                      (	'Kỹ Thuật'),
                      (	'Business Development'),
                      ('Accounting Dep’t '),
                      ('Training'),
                      (' HR Dep’t'),
                      (	'Production');
				
INSERT INTO `Position`	(positionName)
VALUES					('Test'),
						('Dev'),
                        ('Scrum Master'),
                        ('PM'),
                        ('Developers'),
                        ('Database Administrator'),
                        ('Trainee'),
                        ('Software Engineer'),
                        ('Manager'),
                        (' Team Leader');
                        
                        
INSERT INTO `Account`	(	email,					username,		full_name,			departmentID,	positionID,	createDate)
VALUES					('duyduyduy2806@gmail.com',		'zduy12',		'Trần Văn Duy',		1,			2,			'2019-12-20'),
						('acc1@gmail.com',		'Nguyentoan',	'Nguyễn Đức Toàn',		4,			5,			'2019-11-15'),
                        ('acc2@gmail.com',		'Nguyentri',	'Nguyễn Ngọc Trí',		6,			7,			'2019-09-21'),
                        ('acc3@gmail.com',		'Dongoc',		'Đỗ Thị Ngọc',			7,			3,			'2020-01-01'),
                        ('acc4@gmail.com',		'Maihung',		'Mai Thành Hưng',		3,			2,			'2020-01-07'),
                        ('acc5@gmail.com',		'Phungtung',	'Phùng Viết Tùng',		2,			9,			'2020-02-10'),
                        ('acc6@gmail.com',		'Trinhtu',		'Trịnh Thị Tú',			9,			10,			'2020-02-10'),
                        ('acc7@gmail.com',		'Tranhuong',	'Trần Thị Hường',		10,			5,			'2020-02-10'),
                        ('acc8@gmail.com',		'Tranhoa',		'Trần Thị Hòa',		 	5,			8,			'2020-02-10'),
                        ('acc9@gmail.com',	'Hoangthuy',	'Hoàng Thị Thủy',		8,			1,			'2020-02-10');
                        
INSERT INTO `Group`	(	groupName,	creatorID,		createDate)
VALUES				(	'Nhóm A',			2,		'2019-12-10'),
					(	'Nhóm C',			1,		'2019-10-20'),
                    (	'Nhóm B',			5,		'2019-08-04'),
                    (	'Nhóm E',			6,		'2019-11-15'),
                    (	'Nhóm D',			3,		'2019-09-06'),
                    (	'Nhóm H',			8,		'2020-01-05'),
                    (	'Nhóm O',			4,		'2020-02-16'),
                    (	'Nhóm K',			10,		'2020-03-10'),
                    (	'Nhóm J',			9,		'2020-03-05'),
                    (	'Nhóm I',			7,		'2020-03-02');
                    
                    
INSERT INTO GroupAccount	(	groupID,	accountID,	joinDate)
VALUES						(	1,			6,			'2019-10-20'),
							(	2,			8,			'2019-11-18'),
                            (	3,			10,			'2019-09-06'),
							(	4,			5,			'2020-01-15'),
                            (	5,			7,			'2020-02-09'),
                            (	7,			9,			'2020-01-16'),
                            (	6,			3,			'2020-03-10'),
                            (	8,			1,			'2020-03-09'),
                            (	9,			4,			'2019-11-02'),
                            (	10,			2,			'2020-02-11');
                            
INSERT INTO TypeQuestion	(typeName)
VALUES						('Multiple Choice'),
							('Essay'),
                            ('Essay1'),
                            ('True or False'),
                            ('Yes or No');
                          
INSERT INTO CategoryQuestion	(categoryName)
VALUES							('JAVA'),
								('.NET'),
                                ('SQL'),
                                ('Postmen'),
                                ('Ruby');
                               
INSERT INTO Question	( content,															categoryID,		typeID,		creatorID,	createDate)
VALUES					('Mô hình dữ liệu quan hệ được E. F. Codd đề xuất năm nào?',			1,				2,			3,		'2019-11-15'),
						('Thao tác nào sau đây không phải là thao tác cập nhật dữ liệu?',		3,				5,			7,		'2019-12-10'),
                        (' Chỉnh sửa dữ liệu là',												5,				2,			2,		'2019-10-05'),
                        (' Việc đầu tiên để tạo lập một CSDL quan hệ là :',						2,				1,			1,		'2019-09-30'),
                        ('Thao tác khai báo cấu trúc bảng bao gồm :',							4,				3,			2,		'2019-10-28'),
                        ('SQL là từ viết tắt của:',												5,				4,			4,		'2020-01-06'),
                        ('Giá trị NULL được coi là rỗng hoặc bằng 0:',							2,				5,			6,		'2020-02-02'),
                        ('Mục đích của đa hình',												1,				1,			8,		'2019-12-19'),
                        ('Truy vấn cơ sở dữ liệu là gì?',										3,				3,			5,		'2019-11-23'),
                        ('Chức năng của mẫu hỏi (Query) là:',									4,				1,			2,		'2020-03-08');

INSERT INTO Answer	(content,														questionID,		iscorrect)
VALUES				('Tạo ra một hay nhiều bảng',										4,				10),
					('1970',															1,				5),
					(' Sao chép CSDL thành bản sao dự phòng',							2,				11),
					('Structured Query Language',										6,				3),
					(' Thay đổi các giá trị của một vài thuộc tính của một bộ',			3,				1),
					('Sai',																7,				16),
					('Một hành động có thể xảy ra theo nhiều cách khác nhau',			8,				6),
                    ('Thao tác trích xuất thông tin được lưu trữ trong các table',		9,				4),
                    ('Khai báo kích thước của trường',									5,				2),
					('Thực hiện tính toán đơn giản',									10,				7);
                                
					
                    
INSERT  INTO Exam	(codes,		Title,							categoryID,		duration,	CreatorID,	createDate)
VALUES				(112,		'Kiểm tra 15 phút môn Toán ',		5,			15,			1,			'2019-12-20'),
					(456,		'Thi kết thúc môn Toán',			1,			90,			2,			'2019-11-27'),
                    (105,		'Thi giữa kỳ môn Toán',				2,			60,			4,			'2019-12-05'),
					(106,		'Thi kết thúc năm học Văn',			3,			120,		7,			'2019-09-16'),
					(107,		'Thực hành',						4,			45,			9,			'2019-10-10'),
					(203,		'Thi kết thúc học kỳ I',			1,			60,			8,			'2019-11-30'),
					(101,		'Thi giữa kỳ môn Văn',				2,			60,			5,			'2020-01-28'),
					(324,		'Thi kết thúc năm học Toán',		3,			90,			6,			'2020-02-15'),
					(215,		'Kiểm tr 1 tiết môn Văn',			5,			45,			10,			'2020-03-08');
                    
				
INSERT INTO ExamQuestion	(	examID,	questionID)
VALUES						(	1,			10		),
							(	3,			9		),
                            (	7,			5		),
                            (	5,			4		),
                            (	9,			2		),
                            (	8,			1		),
                            (	9,			8		),
                            (	2,			6		),
                            (	6,			7		),
                            (	4,			3		);
