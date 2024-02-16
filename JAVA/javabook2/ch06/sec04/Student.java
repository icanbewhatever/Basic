package javabook2.ch06.sec04;
// 라이브러리 클래스
public class Student {

//	1. 필드(속성, 변수)
//	타입 필드명; 또는 타입 필드명 = 초기값;
	
//	String name; 필드명 중복 안된다
//	기본타입 또는 참조타입을 쓸 수 있다
	
	String name = "유재석";
	int age = 56;
	boolean man = false;
	
//	2. 생성자: 객체를 생성
//	!주의사항: 사용자 생성자를 만든 경우, 기본 생성자를 생략할 수 없다
//	Student(){실행문}: 단독으로 만들었을때 생략할 수 있고, 생략해도 써있다 
//					 그러나 실행문을 적어야 할 땐 꼭 써야한다

//	Student(타입 값1, 타입 값2){
//		실행문;
//	}
	
//	형태 1: 기본생성자(생략 가능): 입력x, 실행할 내용x
	Student(){}
	
//	형태 2: 사용자 생성자(생략 불가): 입력(선택)x, 내용o
	//사용자 생성자가 있을때 기본생성자도 써줘야 한다
	Student(String name){
		System.out.println(name);
//		메서드 사용방법: 메서드(값1, 값2) - 메서드 값의 개수를 맞춰줘야한다
//		study1();	  //메서드를 생성자에서 호출한다
		study2("국어");// 입력값이 있기 때문에()로 쓸 경우 오류
//		study3("수학");
	}

	
//	3. 메서드(기능, 함수)
//	타입 메스드(변수)명(타입 값1, 타입 값2) {}
//	타입 study(타입 값1, 타입 값2) {}
	
//	형태 1 : 입력x, 반환x
//	기능: 기능(함수,메서드)의 설명을 출력하다.
	void study1() {
		System.out.println("나이가" +age + "세인");
//		System.out.println("나이가" + (age+1) +"세인");
		System.out.println(name + "공부하다");
	}
//	형태 2: 입력o, 반환x
//	기능: 어떤 과목을 공부하는지 출력하다
//	입력값: 과목
	void study2(String subject) {// subject 넣은 이유: 문자열 형태의 데이터를 어떤 값을 가져오던지 출력 해주겠다
		System.out.println(subject + "공부하다");
		
	}
	
//	형태 3: 입력o, 반환o 리턴값을 넣어야한다
//	기능: 어떤 과목을 공부하는지 출력하고 과목을 반환한다
//	입력: 과목
//	반환: 과목
	String study3(String subject) {
		System.out.println(subject + "공부하다");
		return "자바";
	}
}
















