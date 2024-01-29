package javabook2.ch07.sec02;

//스마트폰 라이브러리 클래스 - 자식
public class SmartPhone extends Phone {

	//필드
	String image;
	String music;
	String url;
	
	//생성자
	SmartPhone
	(String model, String color,String image, String url, String music){
		super(model, color); 
		this.image = image;
		this.url = url;
		this.music = music;
	}
	
	//메서드
	
	void videoCall() {
		System.out.println("영상통화");
		powerOn();
	}
	void listenMusic(String music) {
		System.out.println("재생 중 음악" +music);
	}
}
