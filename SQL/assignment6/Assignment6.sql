USE TestingSystem;

-- câu 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DROP PROCEDURE IF EXISTS Department_Account;
DELIMITER $$
CREATE PROCEDURE Department_Account ( IN in_deparmentName VARCHAR(50))
	BEGIN
    SELECT		a.accountID, a.email, a.full_name
    FROM		`Account`a
    INNER JOIN	Department d ON a.departmentID = d.departmentID
    WHERE		departmentName = in_deparmentName;
    END$$
DELIMITER ;
 
 CALL Department_Account('Sale');
 
-- câu 2: Tạo store để in ra số lượng account trong mỗi group  
DROP PROCEDURE IF EXISTS Account_Group;

DELIMITER $$
CREATE PROCEDURE Account_Group ()
	BEGIN
		SELECT 		g.groupID,g.groupName, COUNT(accountID) AS Soluong
		FROM		Groupaccount ga
        INNER JOIN	 `Group` g ON ga.groupID = g.groupID
		GROUP BY	g.groupID;
    END$$
DELIMITER ;

CALL Account_Group();
 
-- câu 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tạI
DROP PROCEDURE IF EXISTS Type_of_question;

DELIMITER $$
CREATE PROCEDURE Type_of_question()
	BEGIN
	SELECT	t.typeID ,t.typeName, count(q.questionID) as socauhoi
    FROM	Question		q
    JOIN	Typequestion	t	ON	q.typeID=t.typeID
	WHERE	MONTH(createDate) = MONTH(NOW())
    GROUP BY	t.typeID;
    END$$
    DELIMITER ;
 
-- câu 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
DROP PROCEDURE IF EXISTS type_question;

DELIMITER $$
CREATE PROCEDURE type_question(OUT out_type_question SMALLINT UNSIGNED)
		BEGIN
        SELECT		Q.typeID INTO out_type_question
        FROM		Question Q
        INNER JOIN	Typequestion tq ON Q.typeID=tq.typeID
        GROUP BY	Q.typeID
        HAVING		COUNT(Q.questionID)=	(SELECT max(b)
												FROM(SELECT	COUNT(q1.questionID)AS b
														FROM Question q1
                                                        GROUP BY	q1.typeID) as c);
END$$
DELIMITER ;
SET @typeID = 0;
call type_question(@typeID);
select @typeID;



-- câu 5: Sử dụng store ở question 4 để tìm ra tên của type question 
SELECT	typeName
FROM	TypeQuestion
WHERE	TypeID = @Type_ID;
 
-- câu 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào 
