package javabook2.ch06.sec07;

public class CarExample {

	public static void main(String[] args) {

//		Car mycar = new Car(); //기본생성자 호출
		Car mycar = new Car("현대");// 입력 1개인 생성자 호출
		System.out.println(mycar.model);
		System.out.println(mycar.color);
		System.out.println(mycar.Maxspeed);
		
		mycar.run1();
		name = mycar.run2("홍길동"); // 반환값 사용 불가
		String name;
		name = mycar.run3("아무개");// 반환값 사용 가능
	
		Car brocar = new Car("기아", "흰색");
		System.out.println(brocar.model);
		System.out.println(brocar.color);
		System.out.println(brocar.Maxspeed);

		Car momcar = new Car("현대", "검은색", 300);
		System.out.println(momcar.model);
		System.out.println(momcar.color);
		System.out.println(momcar.Maxspeed);
	}

}
