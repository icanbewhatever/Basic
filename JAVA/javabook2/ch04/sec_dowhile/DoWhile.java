package javabook2.ch04.sec_dowhile;

import java.util.Scanner;

public class DoWhile {

	public static void main(String[] args) {
		// do-while 문
//		메세지 입력 프로그램
//		1.메세지를 입력하세요.
//		2.키보드로 메세지 입력
//		3.q키를 입력해 프로그램 종료	
		
		Scanner sc = new Scanner(System.in);
//		
//		System.out.println("메세지를 입력하세요");
//		String inputStr;
//		inputStr = sc.nextLine();		//입력(문자열) 수행
//		System.out.println(inputStr);
//		
//		sc.close();			//입력 종료
		
		String inputStr;
		
		do {
			System.out.println("메세지를 입력하세요");
			inputStr = sc.nextLine();		//입력(문자열) 수행
			System.out.println(inputStr);
			
		} while(!inputStr.equals("q"));		//!= not

		sc.close();
	}

}
