package javabook2.ch08.sec02;

public class Car {
	//필드
	String company = "현대자동차";
	String model;
	String color;
	int speed = 0;
	
	
	//생성자를 만들어줘야  아래 mycar객체 사용 가능
	public Car() {
	}
	public Car(String model, String color){
		this.model = model;
		this.color = color;
	}
	//메서드
	public static void main(String []args) {
		//일반적인 클래스 사용
	//	HankookTire hkt = new HankookTire();//객체생성해야 호출가능
	//	hkt.roll();
		Car mycar = new Car(); // 기본생성자를 위에 만들어야 사용가능
		mycar.run(); // 아래 기능을 넣어 사용가능
		
		//인터페이스 구현 클래스 사용
		Tire tire_front; // 앞타이어
		tire_front = new HankookTire();
		tire_front.roll();
		
		Tire tire_rear;	// 뒷타이어
		tire_rear = new KumhoTire();
		tire_rear.roll();
		System.out.println("타이어 최대가능 속력"+Tire.MAX_SPEED);
		
		//디폴트 메서드 호출
		tire_front.method();
	}
// 기능 : 주행하다 입력: 없음, 반환: 없음
		void run() {
		System.out.println("주행하다");
	}
}
