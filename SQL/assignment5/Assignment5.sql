USE TestingSystem;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale 
CREATE VIEW 		dsnv_sale AS
SELECT				a.full_name
FROM 				`Account` a 
INNER JOIN			 Department d ON a.departmentID= d.departmentID
WHERE 				d.departmentID = (	SELECT	d1.departmentID
										FROM	Department d1
										WHERE	departmentName='Sale');

SELECT * FROM dsnv_sale;
						
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất  
CREATE VIEW 		ttac AS
SELECT		a.accountID,a.email, COUNT(g.accountID) AS SL
FROM		`Account` a
INNER JOIN 	GroupAccount g ON a.accountID= g.accountID
GROUP BY 	g.accountID
HAVING		SL =(SELECT MAX(b)
				FROM (	SELECT	COUNT(c.accountID) AS b
						FROM	GroupAccount c
						GROUP BY c.accountID) AS c);
                    
SELECT * FROM ttac;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi  
CREATE VIEW chieu_dai_conten as
SELECT questionID, content ,length(content)
from question
where length(content)>28;

SELECT * FROM 			chieu_dai_conten;
 
 DROP VIEW chieu_dai_conten;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW 		DSPB AS
SELECT 				a.departmentID,COUNT(a.accountID) AS SL
FROM 				Department d
INNER  JOIN 		`Account` a ON d.departmentID = a.departmentID
GROUP BY  			a.departmentID
HAVING				SL=(SELECT MAX(b) 
						FROM	(SELECT COUNT(  a.departmentID) AS b
								FROM	`Account` a
								GROUP BY   a.departmentID) AS c);
			
SELECT * FROM DSPB;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyen tạo


CREATE VIEW a AS
SELECT q.*
FROM question q
Join `account` a
on q.creatorID = a.accountID
where a.full_name LIKE N'Nguyễn%';