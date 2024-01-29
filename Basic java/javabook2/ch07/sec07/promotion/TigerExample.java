package javabook2.ch07.sec07.promotion;

public class TigerExample {

	public static void main(String[] args) {
		
		Tiger tiger = new Tiger();
		
		//자동타입변환: 큰타입변수 변수명 = 작은타입객체;
		Animal animal = tiger;
		
		animal.sleep();
		animal.eat(); //호출 가능(오바라이딩 된 경우, 자식메서드 동작)
		
//		animal.sound(); //호출 불가능
		
		
	}

}
