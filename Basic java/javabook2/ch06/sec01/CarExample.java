package javabook2.ch06.sec01;

// 실행 클래스
//(누구나 볼 수 있는) 자동차 예제 설계도
public class CarExample {
		
//	1. 필드(속성)
	
//	2. 생성자
	
//	3. 메서드(동작기능)
	
	//main 함수(매서드): 기능 - 프로그램이 처음 동작을 시작하는 곳
	public static void main(String[] args) {
		
		Car mycar = new Car();
		Car sisters = new Car();
		
		System.out.println(mycar.Cartype); //필드 사용
		mycar.purchase();
		
		
	}

}
