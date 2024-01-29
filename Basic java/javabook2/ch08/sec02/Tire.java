package javabook2.ch08.sec02;

//추상적인 내용
public interface Tire {
	//상수
//	[final] [static] 생략가능
	int MAX_SPEED =250;
	
	//추상메서드 선언
	//[public][abstract] 생략 가능
	void roll();
	
	//디폴드메서드
	default void method() {
		System.out.println(MAX_SPEED); // 상수사용 가능
		roll();						   // 추상메서드 호출가능
	}
}
