package javabook2.ch05.array;

public class Example {

	public static void main(String[] args) {

		int[] iArray1 = null; // 1. null로 배열 초기화
		int iArray2[] = { 1, 2, 3 }; // 2. 값을 넣어 배열 초기화

		int[] iArr3 = new int[2]; // [2]숫자가 아닌 길이를 저장, 배열선언
		System.out.println(iArr3[0]);
		System.out.println(iArr3[1]);

		iArr3[0] = 10; // 배열 값 할당
		iArr3[1] = 20;

		System.out.println(iArr3[0]);
		System.out.println(iArr3[1]);
		printName(); 
	}
	public static void printName() {
		System.out.println("입력도 없고, 출력(반환)도 없는 함수입니다");
	}
	
	
	
//	public static void printName(String name) {
//
//		System.out.println("Hi, I am " + name + "!");
//	}
//
//	public static void main(String[] args) {
//
//		String name = "Mary";
//		printName(name);
//
//		String name1 = "Lucy";
//		printName(name1);
//
//		String name2 = "Alex";
//		printName(name2);
//
//		String name3 = "Zoey";
//		printName(name3);
//	}
	
}


