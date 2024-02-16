package javabook1.condition;

import java.util.Scanner;

public class LoginDemo {

	public static void main(String[] args) {
		
		// 로그인 확인: 아이디 / 비밀번호
		
		//입력 받는 소스 코드 작성
		String id = "kenneth";
		
//		만약 아이디가 kenneth이면 로그인 성공, 그렇지 않으면 로그인 실패 표시
//		if(id == "kenneth") {}		 !!== 같다, 부등호주의!! 
		if(id.equals("kenneth")) {
			System.out.println("로그인 성공!");
		}	
		else {
			System.out.println("로그인 실패ㅜㅜ");
		}
		

	}

}
