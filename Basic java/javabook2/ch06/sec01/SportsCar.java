package javabook2.ch06.sec01;

//라이브러리 클래스
public class SportsCar {

//	1.필드
	
	int wheel1Num = 4; //필드 선언과 할당 = 초기화. 바퀴 수

//	2. 생성자(기본생성자 생략)
	SportsCar(){
		System.out.println("바퀴개수: "+ wheel1Num); // 필드 사용
		run();									  // 메서드 호출(사용)
	}
	
//	3. 메서드
//	기능: [주행하다.]를 출력하다
//	타입 메서드명() {}
	
	void run() {
		System.out.println("바퀴개수: "+ wheel1Num); // 변수필드 사용
		System.out.println("주행하다.");
	}
	
//	System.out.println("바퀴개수: "+ wheel1Num); 불가능, public class SportsCar에 메인이 없기 때문에
	
}
// 클래스 선언 > Tire 
class Tire {

}