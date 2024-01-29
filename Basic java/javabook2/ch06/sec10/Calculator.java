package javabook2.ch06.sec10;

//계산기 라이브러리 클래스
public class Calculator {
	//정적 멤버
	static double pi = 3.14159;
	
	//정적 메서드
//	기능: 원 넓이 구하기 = 반지름 * 반지름 * 3.14
	public static void getCircleArea(int radius) {
		System.out.println(radius * radius * 3.14);
	}
	
	
	//[인스턴스] 필드
	
	String color = "red";
	
	//[인스턴스] 메서드
	void getInfo() {
		System.out.println("계산기 색깔: " + color);
	}
}
