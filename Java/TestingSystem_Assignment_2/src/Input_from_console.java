import java.util.Scanner;

public class Input_from_console {

	public static void main(String[] args) {
		//Question 1: Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình 
				Scanner sc = new Scanner(System.in);
				System.out.println("Mời bạn nhập số nguyên:");
				int a = sc.nextInt();
				System.out.println("Số bạn vừa nhập:"+a);
				sc.close();
				
		////Question 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
				
				Scanner sc1 =  new Scanner (System.in);
				System.out.println("Nhập số thứ nhất:");
				float b = sc1.nextFloat();
				System.out.println("Nhập số thứ hai:");
				float c=sc1.nextFloat();
				System.out.println("***** THÔNG TIN NHẬP *****");
				System.out.println("Số thực thứ nhất vừa nhập:"+b);
				System.out.println("Số thực thứ hai vừa nhập:"+c);
				sc1.close();
				
				
				//Question 3: Viết lệnh cho phép người dùng nhập họ và tên 
				 Scanner scn = new Scanner(System.in);
				 System.out.println("Mời bạn nhập họ tên:");
				 String d = scn.nextLine();
				 System.out.println("Họ tên:"+d);
				 scn.close();
	}

}
