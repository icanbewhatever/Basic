package javabook2.ch08.sec03;

public interface FastRuning {
	//[디폴트 메서드 선언]: 빨리 뛰다
	default void runFast() {
		System.out.println("빨리 뛰다");
	}
}
