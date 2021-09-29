import java.time.LocalDate;
import java.util.Locale;
import java.util.Random;

public class Random_Number {
	public static void main (String[] args) {
		
		//Question 1: In ngẫu nhiên ra 1 số nguyên 
			Random rd = new Random();
			int x = rd.nextInt();
			System.out.println(x);
			
		// Question 2: In ngẫu nhiên ra 1 số thực
			Random r = new Random();
			float y = r.nextFloat();
			System.out.println(y);
			
		//Question 4: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995 
			Random random = new Random();
			int minDay = (int) LocalDate.of(1995, 07, 24).toEpochDay();
			int maxDay = (int) LocalDate.of(1995,12,20).toEpochDay();
			long randomDay = minDay + random.nextInt(maxDay - minDay);
			LocalDate randomDate = LocalDate.ofEpochDay(randomDay);
			System.out.println(randomDate);
			
			
		//Question 7: Lấy ngẫu nhiên 1 số có 3 chữ số 
			Random rdm = new Random();
			int t = rdm.nextInt(100) +900;
			System.out.println(t);
		}
	}
