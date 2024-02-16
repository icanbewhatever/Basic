package javabook2.ch06.sec10;

//사람 실행 클래스
//관계: 사람 [사용] 계산기
public class CalculatorExample {

	public static void main(String[] args) {

		System.out.println(Calculator.pi);
		
		Calculator.getCircleArea(3); //객체생성 필요없다
		
		//인스턴스 멤버 사용
		Calculator luna = new Calculator(); // 객체생성
		
		System.out.println(luna.color);
		luna.getInfo();
		
		
	}
}
