package javabook2.ch07.sec08.car;
//자동차 클래스
public class Car {
	//필드: 타이어
	public Tire tire = new Tire();
	//생성자
	//메서드: 주행하다
	
	public void run() {
		System.out.println("주행하다");
		tire.roll(); 	//타이어가 회전하다	
	}
}
