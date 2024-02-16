package javabook2.ch07.sec10;

public class PhoneExample {

	public static void main(String[] args) {
//		부모객체에 abstract를 쓰면 아래 부모객체를 만들 수 없다
//		Phone myphone = new Phone("홍길동");
		
//		System.out.println("소유자: " +myphone.owner);
//		myphone.turnOn();
//		myphone.turnOff();
		
//		자식클래스에서 가져다가 쓸 수 있다
		SmartPhone brophone = new SmartPhone("홍길동");
		
		System.out.println(brophone.owner);
		brophone.turnOff();
		brophone.turnOn();
		
//		그렇다면 자식클래스에 메서드를 넣을 수 있을까?
		brophone.music = "뉴진스 - 보이";
		brophone.listenMusic(brophone.music);
	
	
	
	}

}
