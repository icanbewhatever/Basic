package javabook1.condition;

import java.util.Scanner;

public class LoginDemo2 {
	public static void main(String[] args) {
		// 문제: Scanner를 사용해 아이디를 입력받아 로그인을 수행하는 프로그램을 작성해라
		// 로그인 확인: 아이디 / 비밀번호
		
		Scanner sc;
		sc = new Scanner(System.in);
		
		System.out.println("아이디를 입력하시오:");
		//입력 받는 소스 코드 작성
		String id = sc.nextLine();
		System.out.println("입력된 아이디:" +id);
		
		sc.close();
		
		
		String DB_id = "kenneth"; //DB에 저장된 id
		
		//만약 아이디가 kenneth이면 로그인 성공, 그렇지 않으면 로그인 실패 표시
//		if(DB_id == "kenneth") {}		 !!== 같다, 부등호주의!! 
		
		System.out.println(DB_id.equals(id));  //test
		
		if(DB_id.equals(id)) {
			System.out.println("로그인 성공!");
		}	
		else {
			System.out.println("로그인 실패ㅜㅜ");
		}
		

	}


}
