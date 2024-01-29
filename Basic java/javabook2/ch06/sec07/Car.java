package javabook2.ch06.sec07;

public class Car {
	//필드(속성)
	
	String model;
	String color;
	int Maxspeed;
	
	
	//생성자(필드 초기화 > 값을 입력한다)
	
//	public Car(){} > 기본 생성자
	
	Car(String model){
//		this.model = model;
//		this()-> 생성자, 매개변수 개수, 타입, 순서 확인 선택적 사용
		this(model, "검정색", 250);
	}
	
	Car(String model, String color) {
//		this.model = model;
//		this.color = color;
		this(model, color, 270);
	}
	
	public Car(String model, String color, int Maxspeed) {
		this.model = model;
		this.color = color;
		this.Maxspeed = Maxspeed;
	}
	
	//메서드(기능)
	
//	int 메서드명(타입 변수) {
//		실행문;
//		return 반환값;
//	}
	
	void run1() {
		System.out.println("주행하다");
	}

	void run2(String drivername) {
		System.out.println(drivername +"주행하다");
	}
	
	String run3(String drivername) {
		System.out.println(drivername + "주행하다");
		return drivername;
	}
}




















