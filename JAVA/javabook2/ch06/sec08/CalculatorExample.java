package javabook2.ch06.sec08;

public class CalculatorExample {

	static String country = "한국";
	
	public static void main(String[] args) {
		
		
		Calculator luna = new Calculator();
		
//		luna.powerOn();
		
		int result3 = luna.plus(10, 20);
		System.out.println(result3);
		
		int result4 = luna.divide(40, 30);
		System.out.println(result4);
		
		luna.powerOff();
	
	}


}
