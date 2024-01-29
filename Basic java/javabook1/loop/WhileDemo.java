package javabook1.loop;

public class WhileDemo {

	public static void main(String[] args) {
		//While문
		
//		문제1: Coding Everbody를 무한반복해서 출력하시오.

		
//		변수선언, 할당
//		while(조건문) {
//			실행문;
//		}

//		String str = "Coding Everybody";
//		while(true) {
//			System.out.println(str);
//		}
		
//		문제2: 다음과 같이 출력하는 프로그램을 작성하시오.
		
//		Coding Everbody0
//		Coding Everbody1
//		Coding Everbody2
//		Coding Everbody3
//		Coding Everbody4

		int i = 0;
		while (i<5) {
			System.out.println("Coding Everybody" +i);
			i++;
		}
		
	}

}
