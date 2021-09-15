USE	TestingSystem;

-- câu 1 :Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT	*
FROM	`account` a
INNER JOIN	Department d ON a.departmentID=d.departmentID;

-- câu 2 : Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010

SELECT *
FROM `account`
WHERE  createDate>20-12-2010;

-- câu 3 : Viết lệnh để lấy ra tất cả các developer

SELECT *
FROM `account` a
INNER JOIN `Position` p ON a.positionID=p.positionID
WHERE p.positionName ='Developers';

-- câu 4 : Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT	d.departmentName, COUNT(full_name) AS SoluongNV
FROM	Department d 
INNER JOIN `account` a ON d.departmentID= a.departmentID
GROUP BY departmentName
HAVING	COUNT(full_name) > 1;

-- câu 5 : Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT	q.content, count(e.questionID) as SL_cauhoi
FROM	ExamQuestion e
INNER JOIN Question q ON  e.questionID= q.questionID
GROUP BY e.questionID;

-- câu 6 : Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT c.categoryName,COUNT(q.categoryID) SLCH
FROM CategoryQuestion c
INNER JOIN Question q ON c.categoryID= q.categoryID
GROUP BY c.categoryID ;

-- câu 7 : Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT	eq.questionID,COUNT(eq.examID) AS SL
FROM 	ExamQuestion eq
INNER JOIN	Exam e ON eq.examID= e.examID
GROUP BY eq.questionID;

-- cau 8 : Lấy ra Question có nhiều câu trả lời nhất 

SELECT		q.content, COUNT(a.answerID) AS SLch
FROM 		Question q 
INNER JOIN 	Answer a ON q.questionID = a.questionID
GROUP BY	q.content
HAVING		SLch =  (SELECT	MAX(SL)
							FROM	(SELECT	COUNT(a.questionID) AS SL
									FROM		Answer a
									GROUP BY	a.questionID) Q);
                                    
-- câu 9 :Thống kê số lượng account trong mỗi group

SELECT 		groupID, count(accountID) AS Soluong
FROM		Groupaccount
GROUP BY	groupID;


-- câu 10 : Tìm chức vụ có ít người nhất

-- câu 11 : Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT 			d.departmentName,p.positionName, GROUP_CONCAT(a.Full_name), COUNT(p.positionID)
FROM			Department d 
JOIN			`Account` a  ON	 d.departmentID = a.departmentID
JOIN			`Position`p  ON  a.positionID = p.positionID
GROUP BY  		d.departmentID, p.positionName ;

-- câu 12 : Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...


SELECT		q.questionID, q.Content, t.TypeName, an.content, a.accountID, a.full_name 
FROM		Question q
JOIN 		TypeQuestion t	ON	q.typeID = t.typeID
JOIN		Answer an    	ON an.questionID = q.questionID
JOIN		 `Account` a		ON	a.accountID = 	q.creatorID;	

-- câu 13 : Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT 			typeName, COUNT(questionID)  
FROM			TypeQuestion tq
JOIN			Question q ON	tq.typeID =q.typeID
WHERE			tq.typeName = 'Essay' OR typeName = 'Multiple-Choice'  
GROUP BY 		tq.typeName ;

-- câu 14 lấy ra gruop ko có account nào

SELECT g.groupName , accountID
FROM `Group` g
LEFT JOIN GroupAccount ga ON g.groupID	=ga.groupID	
WHERE ga.accountID is null
GROUP BY ga.accountID;
-- câu 15 
-- câu 16 : Lấy ra question không có answer nào

SELECT		   q.questionID, q.content, a.answerID
FROM			Question q
LEFT JOIN		Answer a    ON  q.questionID = a.questionID
WHERE			a.answerID IS NULL
GROUP BY        q.content ;

-- câu 17:  a) Lấy các account thuộc nhóm thứ 1 b) Lấy các account thuộc nhóm thứ 2 c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau   

-- câu 18:  a) Lấy các group có lớn hơn 5 thành viên b) Lấy các group có nhỏ hơn 7 thành viên c) Ghép 2 kết quả từ câu a) và câu b) 
