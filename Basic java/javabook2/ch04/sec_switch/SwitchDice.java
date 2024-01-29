package javabook2.ch04.sec_switch;

public class SwitchDice {

	public static void main(String[] args) {
		// 문제: 주사위 프로그램 구현 > 1~6까지의 정수 출력
		// 임의Random의 수 1부터 6까지 정수 출력
		// Math.random() > 실수 생성 범위 0.0 <= [실수] < 1.0 /	자바 함수 랜덤 정수
//		 0.0*6 <= [실수]*6 < 1.0 *6 => 0.0 +1 <= [실수]*6 +1 < 6.0 +1 
//		=> 1.0 <= [실수]*6 +1 < 7.0
		
//		6을 곱해 6까지나오는 수를 만들고 1을 더해 1부터의 주사위 수를 만들 수 있다
//		원하는 값이 100이라면 100을 곱해 100까지 나오는 수를 만들 수도 있다
		
		int num = (int)(Math.random()*6+1);
//		System.out.println(Math.random()*6+1);
//		System.out.println(num);
		
		System.out.println("던져진 주사위 값:");		
	
		switch (num) {
		
		case 1:	
			System.out.println("1"); 	//던져진 주사위 값:2으로 나오려면 모두 sysout.print로 쓴다
			break;
		case 2:
			System.out.println("2");
			break;
		case 3:
			System.out.println("3");
			break;
		case 4:
			System.out.println("4");
			break;
		case 5:
			System.out.println("5");
			break;
		case 6:
			System.out.println("6");
			break;
		}
//		{
//		
//		case 값:
//			System.out.println();
//		break;
//		default:
//			System.out.println();
//		break;
//		
//		}
	}

}
