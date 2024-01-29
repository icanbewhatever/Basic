package javabook2.ch05.memory;

//1. 메소드 영역에 클래스 저장
public class Memory {

	//2. main 스레드 생성
//	스레드(thread): 프로세스 내에서 실제 작업을 수행하는 주체
//	프로세스(process): 실행 중인 프로그램
	public static void main(String[] args) {
		
//		3. 스택stack 영역에 기본타입 변수 저장
		char v1 ='A';
		
		if(v1 == 'A') {
			int v2 = 100;
			double v3 = 3.14;
		}
		boolean v4 = true;
		
		//4. 스택영역에 참조타입 변수(str1) 저장
//		참조타입: String문자열, Class, Array배열
		
		String str1 = "Computer"; //5. 힙영역에 참조타입변수 값이 저장된다 Computer(실제데이터에는 주소값이 있다)
		String str2 = null;
		
//		System.out.println(str1 + str2);
		
		int v5 = 3;
		int v6 = 2;
		int sum =add(3,2);
		System.out.println(sum);
		
//		2. add 스래드 생성
		//덧셈 매서드: a와 b값을 입력받아 a+b값을 반환
//		public static int add(int a, int b) {
//			return a + b;
		}
		
	private static int add(int i, int j) {
		// TODO Auto-generated method stub
		return 0;
	}

}
