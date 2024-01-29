package javabook2.ch05.sec_enum;

public class MonthExpamle {

	public static void main(String[] args) {
		// 변수선언
		// 타입 변수명;
		
//		int a;
		
//		Month a1 = Month.JAN;
//		Month a2 = Month.DEC;

//		문제: 해당 월에 해야할일을 스케줄링하는 프로그램 작성
		//11월: DB
//		12월:JAVA
//		1월: HTML
//		2월: JSP
//		3월: 스마트펙토리
//		4월: SPRING

			
		Month DB = Month.NOV;
		Month Java = Month.DEC;
		Month HTML = Month.JAN;
		Month JSP = Month.FEB;
		Month 스마트펙토리 = Month.MAR;
		Month SPRING = Month.APR;
		
//	switch(변수) {
//	case 값1:
//		System.out.println();
//		break;
//	case 값2:
//	System.out.println();
//	break;
//	case 값3:
//	System.out.println();
//	break;
//	}
		
		switch(Java) {
		case NOV:
			System.out.println("DB_NOV");
			break;
		case DEC:
		System.out.println("Java_DEC");
		break;
		case JAN:
		System.out.println("HTML_JAN");
		break;
		case FEB:
			System.out.println("JSP_FEB");
			break;
		case MAR:
			System.out.println("스마트펙토리_MAR");
			break;
		case APR:
			System.out.println("SPRING_APR");
			break;
		}
		
	}

}
