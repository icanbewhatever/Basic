package javabook2.ch05.array;

public class ArrayCreate {
	// main 메서드
	public static void main(String[] args) {

		int[] iArray1;	//배열선언
		int iArray2[];	//배열선언 []가 뒤에 올 수도 있다

		String[] sArray1; 
		String sArray2[];

		// 배열 초기화 하는 방법: null 또는 값을 넣어 초기화 할 수 있다.

//		int[] iArray1 = null; // 1. null로 배열 초기화
//		int iArray2[] = { 1, 2, 3 }; // 2. 값을 넣어 배열 초기화
//		
//		3. new 연산자로 초기화(선언)
//		타입[] 변수명 = new 타입[길이];

		
//		int[] iArr3 = new int[2]; // [2]숫자가 아닌 길이를 저장, 배열선언
		int[] iArr3 = new int[] {10, 20};	//배열초기화
		
		System.out.println(iArr3[0]);
		System.out.println(iArr3[1]);

		iArr3[0] = 10; // 배열 값 할당
		iArr3[1] = 20;
//		iArry3[2] = 10; --->값을 저장할 수 없다, new int에 2 길이만 저장했기 때문

		System.out.println(iArr3[0]);
		System.out.println(iArr3[1]);

	

	/*
	 * void: 반환(리턴) 값이 없다(원두와물을 넣을때 에스프레소가 안나온다)
	 * 
	 * printName: 함수(메서드)이름 + (){} -> 함수(메서드)선언: 리턴여부 > 리턴을 하려면, void에 타입(int,
	 * double)을 넣는다 리턴이 나올시 메서드 선언(만들기) 리턴값 메서드명(타입 변수명1, 타입 변수명2) { 실행문1; 실행문2;
	 * [return 값;] }
	 */
	
	
	printName(); // 함수호출(사용)

	}

//	void: 반환(리턴) 값이 없다
	public static void printName() {
			System.out.println("입력도 없고, 출력(반환)도 없는 함수입니다");
	}
	
	/*
	 * 함수 형태 1: 입력x, 반환x void add() { System.out.println("더하기"); }
	 * 
	 * // 함수형태 2: 입력o, 반환x void sum(int a, int b) { System.out.println("a 더하기 b"); }
	 * 
	 * // 함수형태 3: 입력o, 반환o int avg(int a, int b) {
	 * System.out.println("a와 b의 평균 구하기"); return a+b/2; }
	 * 
	 * // void : 변환(리턴) 값이 없음 public static void printName(타입 변수명 String str1, int
	 * num1) { return 값; }
	 */

}