package javabook2.ch06.sec08;

//계산기 설계도: 라이브러리 클래스
// 기능: 켜기, 끄기, 더하기, 나누기
public class Calculator {

	//필드
	//생성자
	//메서드
	void powerOn() {
		System.out.println("계산기를 켠다");
		System.out.println("디스플레이를 표시합니다");
		return; // (함수를) 종료할때도 쓸 수 있다
//		System.out.println("커서표시"); -- return 때문에 출력안된다
	}
		
	void powerOff() {
		System.out.println("계산기를 끈다");
	}
	
	int divide(int x, int y) {
		int result = x/y;
		return result;		
	}
	
	int plus(int x, int y) {
		powerOn();
		int result = x + y;
		return result;		
	}
	
}
