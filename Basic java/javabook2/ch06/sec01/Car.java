package javabook2.ch06.sec01;

// main없는 라이브러리 클래스
//(누구나 볼 수 있는) 자동차 설계도
public class Car {
//	문제: 자동차 설계도를 작성하시오
//		자동차가 가지는 속성을 하나 필드로 작성
//		자동차가 가지는 기능을 하나 메서드로 작성
//		1. 필드
	
	int Cartype = 1;
	String name = "1등급 자동차";
	
	
	
//		2. 생성자
	
		Car(){
			
		}
//		3. 메서드
		
		void purchase() {
			System.out.println(Cartype +"번 " +name + "를 구매했다");
		}


}
