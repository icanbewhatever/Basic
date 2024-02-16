package javabook2.ch07.sec06.other;
import javabook2.ch07.sec06.A;

public class C {
	public C() {
	//1. 다른 패키지의 필드와 메서드 사용 불가능
		A a = new A();		//생성자 호출 불가능
		a.field1 = "A필드";	//필드사용 불가능
		a.method1();		//메서드 사용 불가능
	}
	
	public void method3() {
		//1.다른 패키지의 필드와 메서드 사용 불가능
		A a = new A();		
		a.field1 = "A필드";	
		a.method1();		
	}
}
