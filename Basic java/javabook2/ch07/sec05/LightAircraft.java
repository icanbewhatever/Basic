package javabook2.ch07.sec05;

import javabook2.ch07.sec04.Airplane;

//자식클래스
//경비행기
public class LightAircraft extends Airplane {
						//import 해준다
	
	//필드(속성)
//	int passengerNum = 4; //승객수
	
	//생성자
	
	public LightAircraft() {
		//사용불가(다른패키지에 protected가 선언된 필드므로)
		System.out.println(this.passengerNum);
	}

	//메서드(기능)
	void takeoff() {
		System.out.println("빨리 이륙하다");
	}
	
	
}
