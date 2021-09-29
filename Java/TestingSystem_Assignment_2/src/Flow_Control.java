import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

public class Flow_Control {

	public static void main(String[] args) {
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
				 
			// question1;
				 if (account2.department == null) {
					 System.out.println("nhan vien nay chua co phong ban");
				 }
				 else {
					 System.out.println("phong ban nhan vien nay la "
							 + account2.department.name);
				 }
		
			// question2
				 
				 if (account2.groups == null) {
						System.out.println("Nhân viên này chưa có group");
					}
					else if (account2.groups.length ==1 || account2.groups.length ==2) {
						for (Group groups :GroupOfAccount2 ) {
							System.out.println(groups.name);
						}
					}
					else if (account2.groups.length ==3) {
						System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
					}
					else if (account2.groups.length ==4) {
						System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
					}
				 
				// Question 3: 
					System.out.println(account2.department == null ? 
					"Nhân viên này chưa có phòng ban" :"Phòng ban của nhân viên này là:" + account2.department.name );
					
			    // cach khac
					if (account2.department == null) {
						System.out.println("Nhân viên này chưa có phòng ban");
					}
					else {
						System.out.println("Phòng ban của nhân viên này là:" + account2.department.name );
					}
				// question4
					
					System.out.println(account1.position.name == "Dev" ? "Đây là Developer" :"Người này không phải là Developer");
					System.out.println("\n");
					System.out.println("***** SWITCH CASE *****");
					
				//Date Format
					
					System.out.println(account3.createDate.getTime());
					Locale locale =  new  Locale ("vi", "VN");
					DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT,locale);
					String date = dateformat.format(account3.createDate);
					System.out.println(date);
					
					
	}

}
