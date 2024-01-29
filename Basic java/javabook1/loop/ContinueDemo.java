package javabook1.loop;

public class ContinueDemo {

	public static void main(String[] args) {
		// 문제: 다음과 같이 출력하는 프로그램을 작성하시오.( Continue문 사용)
//		출력결과
//		Coding Everbody0
//		Coding Everbody1
//		Coding Everbody2
//		Coding Everbody4
		
		for (int i=0; i<5; i++) {
			if(i==3) {
				continue;
			}
			System.out.println("Coding Everbody"+i);
		}
		
		System.out.println("=====================");
		
		int x = -1;
		while(x<4) {			
			x++;
			if(x==3) {
				continue;
			}
			System.out.println("Coding Everbody"+x);
		}
		
		
	}

}
