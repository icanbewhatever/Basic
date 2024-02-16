package javabook2.ch06.sec13.access;

import javabook2.ch06.sec13.A;

public class C {
	
	
	A a1 = new A(10);
	
	//생성자
	public C() {
		A a = new A(30);
		
		System.out.println(a.field1);
		a.method1(6);
	}
	//메서드
}
