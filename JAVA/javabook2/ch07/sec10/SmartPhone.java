package javabook2.ch07.sec10;

public class SmartPhone extends Phone {

	//필드
	String music;
	//생성자(부모 클래스에 있으면, 자식클래스에도 써준다)
//	public SmartPhone() { 부모클래스에 써있으면 똑같이 만들어준다.
//		//super(); 생략되어있어서 안써도 된다
//	}
		
	SmartPhone(String owner){
		super(owner); 
//(부모클래스에 매게변수String owner이 들어가있으면 super을 생략해줄 수 없다)
	}
	
	//메서드
	void listenMusic(String music) {
		System.out.println(music +" 을 듣다");
	}
	
}
