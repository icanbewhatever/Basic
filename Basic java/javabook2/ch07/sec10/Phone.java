package javabook2.ch07.sec10;

public abstract class Phone {
	//필드
	String owner; //홍길동이 필드에 저장된다
	
	//생성자(필드초기화와 함께 작성)
//	public Phone() { 기본생성자
//	}
	
	Phone(String owner){
		this.owner = owner;
	}//생성자에서만 값을 this.로 재정의 하는건가??
		//메서드
	void turnOn() {
		System.out.println("전원 키다");
	}

	void turnOff() {
		System.out.println("전원 끄다");
	}
}
