package javabook2.ch06.sec14;

//실행 클래스
public class Person {

	public static void main(String[] args) {
	
//		Car mycar = new Car("벤츠", "검정색"); //내 차 출고되다.
		Car mycar = new Car();
		
		
		mycar.setModel("벤츠");
		mycar.setCodel("red");
		mycar.setCodel("black");
		mycar.setSpeed(10);
		mycar.setStop(false);
		
	
//		System.out.println(mycar.model);// 출력불가능
		System.out.println(mycar.getModel());//출력가능
		
	
//		System.out.println(mycar.color);
		System.out.println(mycar.getColor());
		
		
//		System.out.println(mycar.color);
		System.out.println(mycar.getColor());

//		System.out.println(mycar.speed);
		System.out.println(mycar.getSpeed());
		
		
//		System.out.println(mycar.stop);
	
		System.out.println(mycar.isStop());
	}
}
