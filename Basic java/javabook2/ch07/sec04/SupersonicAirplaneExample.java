package javabook2.ch07.sec04;

//자식 클래스 실행 클래스
public class SupersonicAirplaneExample {

	public static void main(String[] args) {

		SupersioncAirplane sa = new SupersioncAirplane();
		
		sa.takeoff();
		
		sa.fly();
		
		//정적필드는 클래스 이름으로 호출 flyMode = 2
		sa.flyMode = SupersioncAirplane.SUPERSONIC;
		
		sa.fly(); // 위의 작용으로 바뀐다
		
		sa.flyMode = SupersioncAirplane.NORMAL;
		sa.fly(); // 위의 작용으로 바뀐다
		
		sa.land();

	}

}
