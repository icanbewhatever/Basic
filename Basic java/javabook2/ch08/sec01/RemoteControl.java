package javabook2.ch08.sec01;
// 인터페이스 선언(정의)
public interface RemoteControl {
	//	1.상수(속성, 명사) - 정해져있다
	static final int MAX_VOLUME = 10;
	
	//	[public static final] 은 생략할 수 있다 - 여기서 상수밖에 쓸 수 없기 때문에
	int MIN_VOLUME = 0;
	
	//인터페이스 선언에서 정의된 추상메서드는 구현 클래스에서 반드시 재정의 한다
	//	2.추상메서드(기능, 동사)--예전부터 사용해온 것, 추상메서드만 사용가능
	//->abstract void 메서드명();
	abstract void turnOn();
	
	//public 과 abstract는 생략가능하다, 없어도 있다.
	void channer(int num);
	
	abstract void turnOff();
	//볼륨을 조절하다
	void setVolum(int volum); 

	//	3.디폴트 메서드
	default void useInternet() {
		System.out.println("인터넷 사용하다");
	}
	
	//[문제] 무음기능을 구현해라
	default void setMute(boolean mute) {
		if(mute) {
			System.out.println("무음");
		}else {
			System.out.println("소리난다");
		}
	}
	
	//	4.정적메서드: [public] 생략가능
	static void changeBattery() {
		System.out.println("배터리교체");		
	}

}	

