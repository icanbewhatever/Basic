package javabook2.ch04.sec_while;

import java.util.Scanner;

public class KeyControl {

	public static void main(String[] args) {
		// 문제: 키 입력(scanner)을 통해 자동차의 속도를 제어하는 프로그램 작성

//		1.키 입력 구현
		Scanner sc = new Scanner(System.in);	//입력준비

//		System.out.println("문자열 입력: ");
//		String str;
//		str = sc.nextLine(); // 문자열 입력 메서드
//		System.out.println(str);

//		sc.close();

//		debugging
//		System.out.println(str=="가속");		//false 입력할 때, 엔터키도 같이 넣어야한다. 숫자비교할때만 쓸 수 있다
//		System.out.println(str.equals("가속"));	// true equals에 엔터키가 포함되어있다. 문자열에 쓴다

//		2. 입력된 키를 사용해 속도 제어 > 분기문(조건문): 1.가속 2.감속 3.정지
		int speed = 0;
		System.out.println("현재속도= " + speed);
		
//		if (str.equals("가속")) { // if(str=="가속") > str.eqauls("가속")
//			System.out.println("속도 증가");
//			speed++;
//		} else if (str.equals("감속")) {
//			System.out.println("속도 감소");
//			speed--;
//		} else if (str.equals("정지")) {
//			System.out.println("정지(속도=0)");
//			speed = 0;
//		}

//		자동차 시동 = > 출발
//		int speed = 0;
//		System.out.println("현재속도= " + speed);
//
//		speed++;
//		speed--;

//		run: 자동차 주행(달리다) > true 주행중 /false 정지
		boolean run = true;		//false
		//[변수] 초기화 과정=======================================================
		
		while (run) {
			System.out.println("주행중");
			//반복 종료 코드 > 자동차정지 코드 run = false
//			run = false;	//자동차 정지
			
			System.out.println("문자열 입력: ");
			String str;
			str = sc.nextLine(); // 문자열 입력 메서드
			System.out.println(str);
			
			if (str.equals("가속")) {
				System.out.println("속도 증가");
				speed++;
			} else if (str.equals("감속")) {
				System.out.println("속도 감소");
				speed--;
			} else if (str.equals("정지")) {
				System.out.println("정지(속도=0)");
				speed = 0;
				run = false;
			}
			System.out.println("현재속도= " + speed);
		

	
		
		sc.close();
		
	}

}
}
