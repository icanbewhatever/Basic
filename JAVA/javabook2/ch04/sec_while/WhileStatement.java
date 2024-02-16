package javabook2.ch04.sec_while;

public class WhileStatement {

	public static void main(String[] args) {
		// while 문
		// 문제 숫자를 0부터 9까지 출력해라

		System.out.println("for문 사용 않하고 출력");
		System.out.println(0);
		System.out.println(1);
		System.out.println(2);
		System.out.println(3);

		System.out.println("for문 사용하여 출력");
//		해석: 변수 i를 0부터 시작해 10보다 작을 때까지 1씩증가하면서 i를 출력
//		문제: 7까지는 정상적으로 출력하다가 8,9는 건너뛰고 싶다 > 분기문(조건문) > if
//		내가푼거
		for (int i = 0; i < 10; i++) {
			if (i > 8) {
				System.out.println(1);
				System.out.println(2);
				System.out.println(3);
				System.out.println(4);
				System.out.println(5);
				System.out.println(6);
				System.out.println(7);
			} else
				System.out.println(8);
			System.out.println(9);
		}

//		정답풀이, if 만약 조건식이 참/거짓이라면, 7을 만났다면 건더뛰어라
//		
		for (int i = 0; i < 10; i++) {
			System.out.println(i);
			if (i == 7) {
				break;
			}
		}

		System.out.println("========while문=========");

//		int 변수 = 값;
//		while(변수>값) {
//			실행문;
//			반복 종료 코드; > while의 조건식을 거짓으로 만들어야 한다
//		}

//		int i = 0;
//		while(i==10) {
//			System.out.println(i); // ...9까지.
//			i++;	//i = i+1

//			i=11;	반복종료코드 > 증감식;
//			System.out.println(i); ..10까지
	

//		문제: break를 사용해, 0부터 5까지 출력
		
		int i =0;
		while(i<=5) {
			System.out.println(i);
			i++;
		}
		
		System.out.println("=============================");
	
		int x = 0;
		while(x<10) {
			if(x>5) {
				break;
			}
			System.out.println(x);
			x++;
		}
		
//			외우기!
//			int sum = 0;
//
//			int i = 0;
//			while(i<10) {
//					System.out.println(i);
//					i++;
//			}
//				
	

	
	}
		
		
	
}