package javabook1.loop;

public class LoopDepthDemo {

	public static void main(String[] args) {
		// 문제: 구구단 2단을 출력하는 프로그램을 작성하시오

		
		System.out.println("2*1 = 2");
		System.out.println("2*2 = 4");
		System.out.println("2*3 = 6");
		System.out.println("2*4 = 8");
		System.out.println("2*5 = 10");
		System.out.println("2*6 = 12");
		System.out.println("2*7 = 14");
		System.out.println("2*8 = 16");
		System.out.println("2*9 = 18");
		
		
		System.out.println("======for문========");
		
	
		for(int i=1; i<10; i++) {
			System.out.println("2*" +i +"=" +2*i);
		}
		
		System.out.println("======while문========");
		
		int i=1;
		while(i<10) {
			System.out.println("2*" +i +"=" +2*i);
			i++;
		}
		
		
		System.out.println("=======3단========");
		
		for(int x=1; x<10; x++) {
			System.out.println("3*" +x +"=" +3*x);
		}
		
		System.out.println("=======4단========");
		
		int x=1;
		while(x<10) {
			System.out.println("4*" +x +"=" +4*x);
			x++;
		}

		System.out.println("=======5단========");
		
		for(int y=1; y<10; y++) {
			System.out.println("5*" +y +"=" +5*y);
		}
		
		
		System.out.println("========정답풀이==중첩이용=======");
		
		for(int j=2; j<10; j++) {
			for(int e=1; e<10; e++) {
			System.out.println(j+ " x "+e+ " = " +e*j); //j는 어떻게 2를 9번 중복되어 나오나??
			}
		}
//		
//		System.out.println("=======6단========");
//		
//		for(int y=1; y<10; y++) {
//			System.out.println("6*" +y +"=" +6*y);
//		}
//		
//		System.out.println("=======7단========");
//		
//		for(int y=1; y<10; y++) {
//			System.out.println("7*" +y +"=" +7*y);
//		}
//		
//		System.out.println("=======8단========");
//		
//		for(int y=1; y<10; y++) {
//			System.out.println("8*" +y +"=" +8*y);
//		}
//		
//		System.out.println("=======9단========");
//		
//		for(int y=1; y<10; y++) {
//			System.out.println("9*" +y +"=" +9*y);
//		}
	}

}
