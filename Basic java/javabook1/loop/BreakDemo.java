package javabook1.loop;

public class BreakDemo {

	public static void main(String[] args) {
		// 문제: 다음과 같이 출력하는 프로그램을 작성하시오.( Break문 사용)
//		출력결과
//		Coding Everbody 3
//		Coding Everbody 6
//		Coding Everbody 9
		
//		내가푼거
		for (int i = 3; i < 13; i += 3) {
			System.out.println("Coding Everybody " + i);
			if (i == 9) {
				break;
			}
		}
	
		System.out.println("========================");
		
//		정답풀이
		for (int i = 3; i < 13; i += 3) {
			 if (i == 12) {
				break;
			}
			System.out.println("Coding Everybody " + i);
		}
				
	}

}
