package javabook2.ch07.sec04;

//자식 클래스
public class SupersioncAirplane extends Airplane {
//	필드
	static final int NORMAL = 1;
	static final int SUPERSONIC = 2;
	public int flyMode = NORMAL;
	
	
// static: 한 곳에서 데이터를 저장하겠다. 
//	       클래스 이름으로 호출 SupersioncAirplane.SUPERSONIC
// final: 값을 재할당 못해준다 한번 입력한 값은 이후에 바꿀 수 없다
	
//	생성자

//	메서드
	@Override
	void fly() {
		if (flyMode == SUPERSONIC) {
			System.out.println("초음속 비행하다");
		} else {
			System.out.println("비행하다");
			super.fly(); //부모메서드
		}

	}

}
