package javabook2.ch02;

import java.util.Scanner;  //라이브러리 클래스 위치

public class ScannerType {

	public static void main(String[] args) {
		// Scanner 타입 변수 활용 : 값을 입력 받기 위해 사용한다
		
		// 1.Scanner 타입 변수 선언 : Scanner sc;
		
		// 라이브러리 클래스: 이미 만들어진 소스코드
		// 2.라이브러리 클래스 추가: 단축기 ctrl + shift + O (자동입력된다)
		
		// 3.변수 할당: new Scanner(System.in)
				
		//4.변수 할당 해제: 변수명.close()
		Scanner sc = new Scanner(System.in);
		
		
		String str1;
		String str2;
			
//		5. 문자열 입력 받고 str변수에 할당 및 출력
		System.out.println("이름을 입력하세요.");
		str1 = sc.nextLine();	// 입력문자열 할당
		
		System.out.println("성별을 입력하세요.");
		str2 = sc.nextLine();	
		
		System.out.println("당신의 이름은?:");
		System.out.println(str1); // 출력
		System.out.println("당신의 성별은?:");
		System.out.println(str2); 
		
		sc.close(); //변수 할당 해제: 입력을 받겠다
	

	}

}
