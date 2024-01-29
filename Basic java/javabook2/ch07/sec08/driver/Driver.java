package javabook2.ch07.sec08.driver;

public class Driver {
	
	String name;
	
	Driver(String name){
		this.name = name;
	}
	//운전하다
	public void drive(Vehicle vehicle) {
		System.out.println(name + "가 운전하다");
		vehicle.run();
	}

}
