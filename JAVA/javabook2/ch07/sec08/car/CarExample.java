package javabook2.ch07.sec08.car;
//실행클래스
public class CarExample {

	public static void main(String[] args) {
		Car mycar = new Car();
		
		mycar.run();
		System.out.println("============");
		mycar.tire = new HankookTire();
		mycar.run();
	}
}
