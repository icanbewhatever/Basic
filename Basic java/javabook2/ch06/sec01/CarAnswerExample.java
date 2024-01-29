package javabook2.ch06.sec01;

//실행 클래스
// (누구나 볼 수 있는) 자동차예제 설계도
public class CarAnswerExample {

	
		//	문제: 자동차 설계도를 작성하시오
//		자동차가 가지는 속성 출력(표시)하시오
//		자동차가 기능을 하니 수행(프로그래밍) 하시오
//		1. 필드(속성)
//		2. 생성자
//		3. 메서드(기능)
//			main 함수(매서드)
//	기능: 프로그램이 처음 동작을 시작하는 곳
		
		
	public static void main(String[] args) {
		
		CarAnswer myCar = new CarAnswer();
		CarAnswer momCar = new CarAnswer();
		
		myCar.run();
		myCar.displaySpeed();
		momCar.run();
		momCar.displaySpeed();
	
		System.out.println(myCar.company);
		System.out.println(myCar.model);
		System.out.println(myCar.maxSpeed);
		
		System.out.println(momCar.company);
		System.out.println(momCar.model);
		System.out.println(momCar.maxSpeed);
	}
}
