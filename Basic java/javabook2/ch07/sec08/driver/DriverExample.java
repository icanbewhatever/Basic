package javabook2.ch07.sec08.driver;

public class DriverExample {

	public static void main(String[] args) {

		Driver luna;
		luna =  new Driver("luna");
		
		Bus bus = new Bus();
		Taxi taxi = new Taxi();

		luna.drive(bus);
		luna.drive(taxi);
	
	
	}

}
