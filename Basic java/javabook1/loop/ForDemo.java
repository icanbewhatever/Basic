package javabook1.loop;

public class ForDemo {

	public static void main(String[] args) {
		// 문제: 다음과 같이 출력되는 프로그램을 작성하시오.
//		Coding Everbody 3
//		Coding Everbody 6
//		Coding Everbody 9
//		Coding Everbody 12

		for (int i = 3; i < 13; i = i + 3) { //i+=3
			System.out.println("Coding Everybody " + i);
		}

		System.out.println("==================");

		for (int i = 3; i < 13; i++) {
			if (i % 3 == 0)
				System.out.println("Coding Everybody " + i);
		}

		System.out.println("==================");

		for (int i = 3; i < 13; i++) {
			while (i % 3 == 0) {
				System.out.println("Coding Everybody " + i);
				i++;
			}
		}

		System.out.println("==================");
//		i=> 3 6 9 12
		for (int x = 3; x < 13; x = x+3) {
			if (x % 3 == 1) {
				continue;
			}
			System.out.println("Coding Everybody " + x);
		}

	}

}
