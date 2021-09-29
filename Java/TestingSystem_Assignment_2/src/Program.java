import java.util.Date;

public class Program {

	public static void main(String[] args) {
		// logic
		
		// create department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";
		
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketting";
	
		// create Position
		Position position1 = new Position();
		position1.id =1;
		position1.name = "Thực tập sinh";
		
		Position position2 = new Position();
		position2.id =3;
		position2.name = "Kế toán";
		
		Position position3 = new Position();
		position3.id =3;
		position3.name = "CEO";
		
		//create Account
		Account account1 = new Account ();
		account1.id =1;
		account1.email = "duyduyduy2806@gmail.com";
		account1.userName="duyduy";
		account1.fullName = "Trần Văn Duy";
		account1.department = department1;
		account1.position = position1;
		account1.createDate= new Date ("2020/04/22");
		
		Account account2 = new Account ();
		account2.id =2;
		account2.email = "duyduy@gmail.com";
		account2.userName="Tranduy";
		account2.fullName = "Tran Van Duy";
		account2.department = department1;
		account2.position = position1;
		account2.createDate= new Date ("2020/04/22");
		
		Account account3 = new Account ();
		account3.id =2;
		account3.email = "duyduy1@gmail.com";
		account3.userName="Tranduy1";
		account3.fullName = "Tran Van Duy1";
		account3.department = department1;
		account3.position = position1;
		account3.createDate= new Date ("2020/04/22");
		
		
		// create Group
		Group group1 = new Group();
		group1.id =1;
		group1.name = "Java Fresher" ;
		group1.creator = account1;
		group1.createDate= new Date ("2020/04/18");
		
		
		Group group2 = new Group();
		group2.id =2;
		group2.name = "C# Fresher" ;
		group2.creator = account2;
		group2.createDate=new Date ("2020/04/19");
		
		Group group3 = new Group();
		group3.id =3;
		group3.name = "C# Fresher" ;
		group3.creator = account3;
		group3.createDate=new Date ("2020/04/22");
		
		Account[] AccountOfDepartment1 = { account1,account2, account3};
		department1.employees = AccountOfDepartment1;
		
		Account[] AccountOfDepartment2 = { account1,account2};
		department2.employees = AccountOfDepartment2;
		
		Group [] GroupOfAccount1 = {group1, group2};
		account1.groups = GroupOfAccount1;
		
		Group [] GroupOfAccount2 = {group1, group3};
		account2.groups = GroupOfAccount2;
		
		Group [] GroupOfAccount3 = {group1, group2,group3};
		account3.groups = GroupOfAccount3;
		
		Account[] AccountOfGroup1 = {account1, account2, account3};
		group1.participants = AccountOfGroup1;
		
		Account[] AccountOfGroup2 = {account1,account3};
		group2.participants = AccountOfGroup2;
		
		Account[] AccountOfGroup3 = {account1, account2};
		group3.participants = AccountOfGroup3;
		
		//create TypeQuestion
		TypeQuestion type1 = new TypeQuestion();
		type1.id =1;
		type1.name = "Multiple Choice";
		
		TypeQuestion type2 = new TypeQuestion();
		type2.id =2;
		type2.name = "Essay";
		
		TypeQuestion type3 = new TypeQuestion();
		type3.id =3;
		type3.name = "Yes or No";
		
		// create CategoryQuestion
		 CategoryQuestion category1 = new CategoryQuestion();
		 category1.id =1;
		 category1.name = "SQL";
		 
		 CategoryQuestion category2 = new CategoryQuestion();
		 category2.id =2;
		 category2.name = "ASP.NET";
		 
		 CategoryQuestion category3 = new CategoryQuestion();
		 category3.id =3;
		 category3.name = "Java core";
		 
		// create Answer
		  Answer answer1 = new Answer ();
		  answer1.id =1;
		  answer1.Content = "Khai báo kích thước một trường";
		  answer1.isCorrect =true ;
		  
		  Answer answer2 = new Answer ();
		  answer2.id =2;
		  answer2.Content = "Thực hiện tính toán đơn giản";
		  answer2.isCorrect = false;
		  
		  Answer answer3 = new Answer ();
		  answer3.id =3;
		  answer3.Content = "Là một trường trong một bảng mà nhận diện một cách duy nhất mỗi hàng/bản ghi trong một bảng dữ liệu";
		  answer3.isCorrect = true;
		 
		 //create Question
		 Question question1 = new Question ();
		 question1.id = 1;
		 question1.content = "Chức năng mẫu câu hỏi Query";
		 question1.creator = account1;
		 question1.type = type1;
		 question1.category= category1;
		 question1.createDate = new Date ("2020/04/20");
		 
		 Question question2 = new Question ();
		 question2.id = 2;
		 question2.content = "Thao tác khai báo cấu trúc bao gồm";
		 question2.creator = account2;
		 question2.type = type2;
		 question2.category= category2;
		 question2.createDate = new Date ("2020/04/19");
		 
		 Question question3 = new Question ();
		 question3.id = 3;
		 question3.content = "Primary key là gì";
		 question3.creator = account3;
		 question3.type = type3;
		 question3.category= category3;
		 question2.createDate = new Date ("2020/04/22");
		 
		//create exam
		 Exam exam1 = new Exam();
		 exam1.id =1;
		 exam1.code = 123;
		 exam1.creator = account1;
		 exam1.duration = 15;
		 exam1.title = "Kiểm tra môn Toán";
		 
		 Exam exam2 = new Exam();
		 exam2.id =2;
		 exam2.code = 124;
		 exam2.creator = account2;
		 exam2.category = category2;
		 exam2.duration = 30;
		 exam1.title = "Kiểm tra môn Hóa";
		 
		 Exam exam3 = new Exam();
		 exam2.id =3;
		 exam2.code = 122;
		 exam2.creator = account3;
		 exam2.category = category3;
		 exam2.duration = 60;
		 exam1.title = "Kiểm tra môn cơ sở dữ liệu";
		 
		 // 1 question có nhiều answer
		 Answer [] QuestionOfAnswer1 = {answer1, answer2};
		 question1.answers = QuestionOfAnswer1;
		 
		 Answer [] QuestionOfAnswer2 = {answer1, answer2};
		 question2.answers = QuestionOfAnswer2;
		 
		 Answer [] QuestionOfAnswer3 = {answer1, answer2};
		 question3.answers = QuestionOfAnswer3;
		 
		// 1 question co nhieu exam
		 Exam [] QuestionInExam1 = { exam1, exam2,exam3};
		 question1.exams = QuestionInExam1;
		 
		 Exam [] QuestionInExam2 = { exam1, exam2};
		 question2.exams = QuestionInExam2;
		 
		 Exam [] QuestionInExam3 = { exam2,exam3};
		 question3.exams = QuestionInExam3;
		 
		 //1 exam co nhiu question
		 Question [] QuestionOfExam1 = {question1, question2};
		 exam1.questions = QuestionOfExam1;
		 
		 Question [] QuestionOfExam2 = {question1, question2};
		 exam2.questions = QuestionOfExam2;
		 
		 Question [] QuestionOfExam3 = {question1, question2};
		 exam3.questions = QuestionOfExam3;
		  
		System.out.println ("Thông tin phòng ban 1:");
		System.out.println("Name:" + department1.name);
		System.out.println("ID:" + department1.id);
		System.out.println("\n");
		
		System.out.println ("Thông tin phòng ban 2:");
		System.out.println("Name:" + department2.name);
		System.out.println("ID:" + department2.id);
		System.out.println("\n");
		
		System.out.println ("Thông tin group 1:");
		System.out.println("Name:" + group1.name);
		System.out.println("ID:" + group1.id);
		System.out.println("\n");
		
		System.out.println ("Thông tin group 1:");
		System.out.println("Name:" + group1.name);
		System.out.println("ID:" + group1.id);
		System.out.println("\n");
		
		System.out.println ("Thông tin chức vụ 1:");
		System.out.println("ID:" + position1.id);
		System.out.println("Name:" + position1.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin chức vụ 2:");
		System.out.println("ID:" + position2.id);
		System.out.println("Name:" + position2.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin TypeQuestion 1:");
		System.out.println("ID:" + type1.id);
		System.out.println("Name:" + type1.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin TypeQuestion 2:");
		System.out.println("ID:" + type1.id);
		System.out.println("Name:" + type1.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin CategoryQuestion 1:");
		System.out.println("ID:" + category1.id);
		System.out.println("Name:" + category1.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin CategoryQuestion 2:");
		System.out.println("ID:" + category2.id);
		System.out.println("Name:" + category2.name);
		System.out.println("\n");
		
		System.out.println ("Thông tin Exam 1:");
		System.out.println("ID:" + exam1.id);
		System.out.println("Code:" + exam1.code);
		System.out.println("CreatorID:" + exam1.creator);
		System.out.println("Category:" + exam1.category.name);
		System.out.println("Duration:" + exam1.duration);
		System.out.println("Title:" + exam1.title);
		System.out.println("\n");
		
		System.out.println ("Thông tin Exam 2:");
		System.out.println("ID:" + exam2.id);
		System.out.println("Code:" + exam2.code);
		System.out.println("CreatorID:" + exam2.creator);
		System.out.println("Category:" + exam2.category.name);
		System.out.println("Duration:" + exam2.duration);
		System.out.println("Title:" + exam2.title);
		System.out.println("\n");
		
		System.out.println ("Thông tin Answer 1:");
		System.out.println("ID:" + answer1.id);
		System.out.println("Content:" + answer1.Content);
		System.out.println("isCorrect:" + answer1.isCorrect);
		System.out.println("\n");
		
		System.out.println ("Thông tin Answer 2:");
		System.out.println("ID:" + answer2.id);
		System.out.println("Content:" + answer2.Content);
		System.out.println("isCorrect:" + answer2.isCorrect);
		System.out.println("\n");
		
		System.out.println ("Thông tin Question 1:");
		System.out.println("ID:" + question1.id);
		System.out.println("Content:" + question1.content);
		System.out.println("Creator:" + question1.creator.fullName);
		System.out.println("Type:" + question1.type.name);
		System.out.println("Category:" + question1.category.name);
		System.out.println("CreateDate:" + question1.createDate);
		System.out.println("\n");

		System.out.println ("Thông tin Question 2:");
		System.out.println("ID:" + question2.id);
		System.out.println("Content:" + question2.content);
		System.out.println("Creator:" + question2.creator.fullName);
		System.out.println("Type:" + question2.type.name);
		System.out.println("Category:" + question2.category.name);
		System.out.println("CreateDate:" + question2.createDate);
		System.out.println("\n");
		
	
		
		
	}

}
