package javabook2.ch04;

public class ContinueExample {

	public static void main(String[] args) {
		// for문 문법 ================

//		for(변수초기화; 조건식; 증감식) {
//			실행문;
//		}

//		for (int i = 0; i < 10; i++) {
//			
//			System.out.println(i);
//			만약, i가 5가되면 잠깐 멈춰서 이후 코드를 실행하지 않고 반복문의 앞으로 돌아가라
//			if(i==5) {
//			continue;
//			}
//			System.out.println(i);  //사용불가능한 실행문
//		}

//		[문제] 짝수일 때만 특정 코드를 실행하고 싶다.
//		i=> 0 1 2 3 4 5 6 7 8 9
		for (int i = 0; i < 10; i++) {
//			System.out.println(i);
			if (i % 2 == 1) {	//홀수인 경우. 0 1 0 1 0 1 0
				continue;		//뒷 코드를 실행하지 않고 반복의 처음으로 돌아가라
			}
			// 홀수인 경우 실행되지 않는 코드
			System.out.println(i); //0, 2, 4, 6, 8
		}
	}

}
