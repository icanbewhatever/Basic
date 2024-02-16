package javabook2.ch07.sec02;

//전화기 라이브러리 클래스 - 부모
public class Phone {
	
//	필드(속성 - 명사)
	
	String model;
	String color;
	
//	[부모]생성자 > super()
	Phone(String model, String color){
		this.model = model;
		this.color = color;
	}
	
//	메서드(기능-동사)
	void powerOn() {
		System.out.println("전원 키다");
	}
	
	void powerOff() {
		System.out.println("전원 끄다");
	}
	
	void sendVoice(String message) {
		System.out.println("음성 송산하다");
	}
	void receiveVoice() {
		System.out.println("음성 수신하다");
	}
}
