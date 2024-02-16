package javabook2.ch07.sec01;

public class BExample {

	public static void main(String[] args) {
		B b= new B(); //B클래스 호출
		
		b.field2 = "자식필드";
		b.method2(); //자식메서드
		
		
		b.field1 =1234;	//부모 필드
		b.method1();	//부모 메서드
	}

}
