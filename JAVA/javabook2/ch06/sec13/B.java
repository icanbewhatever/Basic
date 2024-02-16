package javabook2.ch06.sec13;

// A 클래스와 같은 패키지 클래스
public class B {
	//필드
	A a1 = new A(10);
	
	//생성자
	public B() {
		A a = new A(20);
		
		System.out.println(a.field1);
		a.method1(5);
	}	
	//메서드
}

