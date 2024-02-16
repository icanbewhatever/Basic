package javabook2.ch05.array;

public class ArrayInArray3 {

	public static void main(String[] args) {
		// 문제: 다차원 배열을 선언해라
		// String[] book = {"이것은 자바다", "오라클SQL", "HTML5&CSS"};

		// 2차원 배열 선언
		String[][] book = { 
				{ "이것은 자바다", "오라클SQL", "HTML5&CSS" }, 
				{ "한빛", "길벗", "한빛" }, 
				{ "자바", "SQL", "HTML" } 
		};

		// 문제: 1차원 배열 선언하시오(new 연산자 사용)

//		String[] book3 = new String[3];
//		
//		book3[0] = "이것은 자바다";
//		book3[1] = "오라클SQL";
//		book3[2] = "HTML5&CSS";  

		// 풀이
//		int a =1;
//		int[] a = {1,2,3,4};
		int[] a = new int[4];

		a[0] = 1;
		a[1] = 2;
		a[2] = 3;
		System.out.println(a[0]);
		System.out.println(a[1]);
		System.out.println(a[2]);

		// 문제: 2차원 배열에 할당된 데이터를 출력하시오(for문 사용)

//		System.out.println(book2.length);
//		System.out.println(book2[0].length);
//		System.out.println(book2[1].length);

		// 풀이
		System.out.println("==============");
		for (int i = 0; i < 3; i++) {
			System.out.println(book[i][0]);
		}
		
		System.out.println("==============");
		
		for (int i = 0; i < 3; i++) {
			System.out.println(book[i][1]);
		}
		
		System.out.println("==============");
		for (int j = 0; j < 3; j++) {
			System.out.println(book[0][j]);
		}

		System.out.println("==============");
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				System.out.println(book[i][j]);
			}
//		왜 length는 쓰지 않나???
		}

	}
}