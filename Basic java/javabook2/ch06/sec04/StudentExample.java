package javabook2.ch06.sec04;
// 실행 클래스
public class StudentExample {
	
//	1. 필드
//	2. 생성자
//	3. 메서드
	
	public static void main(String[] args) {
		// 클래스타입 변수명; --클래스 선언
		   Student kim;
		
//		1. null 초기화
		kim = null;// 값 할당
		
//		2. new 연산자 초기화
		kim = new Student(); 
// 라이브러리 클래스에서 생성자에 의해 실행 클래스에서 객체 생성 값 할당 , 
// Student()가 생성자(함수)를 가르킨다. Student()를 사용하겠다
		
	
		
		Student park = new Student(); //초기화(선언과할당)
//	입력값이 없으면 입력값이 없는 라이브러리 클래스의 기본생성자를 사용
		Student lee = new Student();
		
		System.out.println("실행클래스 동작"); // 독립적 코드
		
		Student lim = new Student("이순신"); 
		// 이순신이라는 입력값을 주면 라이브러리 클래스에서 밑의 코드를 찾아 출력해준다
//		Student(String name){
//			System.out.println(name);
//			study2("국어");
//		}
				
	}

}
