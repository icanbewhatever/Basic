package javabook2.ch04.sec_for;

public class ForStatement {

	public static void main(String[] args) {

//		int i = 0;
//		i = i + 1;
//		System.out.println(i);
		
//		i++;
//		++i;
		
		
//		for(초기화식; 조건식[i<반복횟수]; 증감식) => 초기화식:변수선언/할당(초기화 한다) 조건식:참/거짓,부등호
//				>>조건식이 참일 때, 실행한다
		
		for(int i=0;i<6;i++) {
			System.out.println(i);			
		}
	
		System.out.println("=======================");
		
//		문제1. 숫자를 출력하려고 함 5 4 3 2 1 0
		
		for(int i=5;i>=0; i--) {
			System.out.println(i);			
		}
		
		System.out.println("=======================");
		
//		문제2. 0 2 4 6 8
//		int i = i+2;
		
		for(int i=0; i<9; i=i+2) {
			System.out.println(i);			
		}
		
		System.out.println("=======================");
		
//		문제3. 1부터 5까지 합을 구하는 프로그램을 작성해라
		
			
//		sum = 1;
//		sum = sum +2;
//		sum = 1+2+3;
//		sum = sum +4
//		sum => 0 1 3 6 10 15
//		i	=> 1 2 3 4 5 6
		
		int sum = 0;
		
		for(int i=1; i<6; i++) {
			sum = sum + i;		// sum += i
			System.out.println(sum);
		}
		
		
		
		
	}

}
