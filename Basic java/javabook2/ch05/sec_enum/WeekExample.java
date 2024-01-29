package javabook2.ch05.sec_enum;

public class WeekExample {

	public static void main(String[] args) {
		// 열거(enum)타입
		// 타입 변수명
		
		int num;
		Week today = null;
		today = Week.WEDNESDAY;
		
		Week yesterday;
		yesterday = Week.TUESDAY;
		
		Week tomorrow;
		tomorrow = Week.THURSDAY;
		
		
		switch(yesterday) {
		
		case MONDAY:
			System.out.println("월: 등원");
			break;
		case TUESDAY:
			System.out.println("화: 등원");
			break;
		case WEDNESDAY:
			System.out.println("수: 등원");
			break;
		case THURSDAY:
			System.out.println("목: 등원");
			break;
		case FRIDAY:
			System.out.println("금: 등원");
			break;
		case SATURDAY:
			System.out.println("토: 휴가");
			break;
		case SUNDAY:
			System.out.println("일: 집");
			break;
		}
	}

}
