package javabook2.ch07.sec05;

import javabook2.ch07.sec04.Airplane;

// 자식 클래스 실행 클래스
	public class LightAircraftExample {
		
		public static void main(String[] args) {
		Airplane ap = new Airplane(); 
		//import로 다른패키지 호출했지만 필드가 protected되서 사용불가
		
		LightAircraft la = new LightAircraft();
		la.takeoff();
	}

}
