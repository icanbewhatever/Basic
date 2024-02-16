package javabook2.ch07.sec07.casting;

public class TigerExample {

	public static void main(String[] args) {
		
		Animal animal = new Tiger(); //자동형변환
		
//		Tiger tiger = new Tiger();
//		Animal animal;	//클래스 변수 선언
//		animal = tiger;	//변수 값 할당
		
//		작은타입변수 변수명 = (작은타입변수)큰타입객체;
		
//		int ival = 0;
//		double dval = (int)ival;
		
		Tiger tiger = (Tiger)animal; //강제(명시적) 형변환
		
		tiger.eat();
		tiger.sleep();
		tiger.sound();
	}
}
