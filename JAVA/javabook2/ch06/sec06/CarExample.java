package javabook2.ch06.sec06;

public class CarExample {

	public static void main(String[] args) {
	
		Car mycar = new Car("현대", "카니발");
		
			
		System.out.println(mycar.company);
		System.out.println(mycar.model);
		
		Car brocar = new Car ("기아");
		
		System.out.println(brocar.company);
		System.out.println(brocar.model);
		
		Car momcar;
		momcar = new Car(2010);
	}
}
