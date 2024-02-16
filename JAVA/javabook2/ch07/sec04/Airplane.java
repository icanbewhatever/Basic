package javabook2.ch07.sec04;
//부모 클래스
public class Airplane {
//	필드
	protected int passengerNum = 0;
//	생성자
	
//	메서드
	//착륙하다
	void land() {
		System.out.println("착륙하다");
	}
	//비행하다
	void fly() {
		System.out.println("비행하다");
	}
	//이륙하다
	void takeoff() {
		System.out.println("이륙하다");
	}	
}
