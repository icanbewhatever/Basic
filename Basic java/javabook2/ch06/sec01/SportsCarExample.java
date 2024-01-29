package javabook2.ch06.sec01;

//실행 클래스
public class SportsCarExample {

	//main이 있고 밑에 코드가 있으면 실행할 수 있다.
	public static void main(String[] args) {
//	라이브러리 클래스(설계도)의 생성자를 사용해 객체 생성(만들겠다) 
//		SportsCar 설계도에 따라 내 차(myCar)를 생성
		SportsCar myCar = new SportsCar(); // 생성자 사용
		
		// 다른 클래스에서 사용하는 경우
//		내 차의 바퀴개수를 출력. 내차의 기능인 주행을 수행
		System.out.println(myCar.wheel1Num); //필드 사용
		myCar.run(); // 메서드 호출(사용) 다른 값을 써줄땐, 변수명.+메서드명
		
		
		
	}
}
