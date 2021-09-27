import java.util.Date;

public class Program {

	public static void main(String[] args) {
		// logic
		
		// create department
		Department department1 = new Department();
		department1.id=1;
		department1.name="Sale";
		
		Department department2 = new Department();
		department2.id=2;
		department2.name="marketing";
		
		Department department3 = new Department();
		department3.id=3;
		department3.name="HRM";
		
		// create position
		Position position1 = new Position();
		position1.id=1;
		position1.name="Dev";
		
		Position position2 = new Position();
		position2.id=2;
		position2.name="Test";
		
		Position position3 = new Position();
		position3.id=3;
		position3.name="Scrum Master";
		
		// create Account
		Account account1 = new Account();
		account1.id=1;
		account1.email="duyduyduy2806@gmail.com";
		account1.fullName="tran van duy";
		account1.CreateDate= new Date ("1998/6/28");
		account1.department=department1;
		account1.position = position1;
		
		Account account2 = new Account();
		account2.id=2;
		account2.email="acc12806@gmail.com";
		account2.fullName="tran van khanh";
		account2.CreateDate= new Date ("1998/5/27");
		account2.department=department2;
		account2.position = position1;
		
		Account account3 = new Account();
		account3.id=3;
		account3.email="acc12806@gmail.com";
		account3.fullName="Pham Van Duy";
		account3.CreateDate= new Date ("1998/5/6");
		account3.department=department3;
		account3.position = position1;
				
		
		//Group
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
		
		// in
		System.out.println("thong tin phong ban 1: ");
		System.out.println("name: " + department1.name);
		System.out.println("id: "+ department1.id);
		
		
		System.out.println("thong tin account 1: ");
		System.out.println("id: " + account1.id);
		System.out.println("email: "+ account1.email);
		System.out.println("fullName: "+ account1.fullName);
		System.out.println("Department Name :"+ account1.department.name);
		System.out.println("Date: "+ account1.CreateDate);
		
		
		System.out.println(group1.name);
		
		
	
		
		
	}

}
