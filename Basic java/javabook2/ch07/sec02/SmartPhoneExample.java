package javabook2.ch07.sec02;

// 스마트폰 예제 실행 클래스
public class SmartPhoneExample {

	public static void main(String[] args) {
		
		SmartPhone myPhone = new SmartPhone
		("아이폰8", "white", "내사진", "naver.com", "김동률-감사");
		
		
		myPhone.powerOn();
				
		System.out.println(myPhone.model);
		System.out.println(myPhone.color);
		System.out.println(myPhone.image);
		
		myPhone.videoCall();
		myPhone.listenMusic("감사");
		
		myPhone.sendVoice("ㅎㅇ");
		myPhone.powerOff();
	}
}
