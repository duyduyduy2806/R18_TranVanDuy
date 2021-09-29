import java.util.Date;

public class Exam {
	int			id;
	int			code;
	String		title;
	CategoryQuestion	category;
	int			duration;
	Account		creator;
	Date		createDate;
	Question [] questions;
}
