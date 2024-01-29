package javabook2.ch06.sec01;

public class CarAnswer {

	//	문제: 자동차 설계도를 작성하시오
//	자동차가 가지는 속성을 하나 필드로 작성
//	자동차가 가지는 기능을 하나 메서드로 작성
//	1. 필드(속성)
	
	String company = "현대자동차";
	String model = "tusan";
	int maxSpeed = 300;


//	2. 생성자


//	3. 메서드(기능)
//	기능: 주행하다	
	void run() {
		System.out.println("주행하다.");
	}

//	기능: 속도를 표시하다.
	void displaySpeed() {
		System.out.print("속도를 표시하다");
		System.out.println("최고속도: " +maxSpeed);

	}
}
