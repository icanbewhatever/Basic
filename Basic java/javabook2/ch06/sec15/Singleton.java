package javabook2.ch06.sec15;

public class Singleton {
	
//	1.[생성자]외부에서 new 연산자로 생성자를 호출할 수 없도록 private 설정 
//	2.[필드](본인의)클래스 타입으로 정적필드 선언하고 private 설정 및 객체 생성
//	3.[메서드]외부에서 호출할 수 있는 정적 메서드 getInstance() 선언
	
	
	//필드
	private static Singleton single = new Singleton();
	
	int num;
	
	//생성자: private로 외부에서 생성자 객체를 만들지 못한다
	
	private Singleton() {
	}
	
	//메서드
	public static Singleton getInstance() {
		return single;
	}
	
	void func() {
		System.out.println("함수다");
	}
}
