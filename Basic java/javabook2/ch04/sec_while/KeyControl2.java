package javabook2.ch04.sec_while;

import java.util.Scanner;

public class KeyControl2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int speed = 0;
		System.out.println("현재속도= " + speed);
		
		boolean run = true;		//false
		//[변수] 초기화 과정=======================================================
		
		while (run) {
			System.out.println("주행중");
						
			System.out.println("문자열 입력: ");
			String str;
			str = sc.nextLine(); // 문자열 입력 메서드
						
			if (str.equals("가속")) {
				System.out.println("속도 증가");
				speed++;
			} else if (str.equals("감속")) {
				System.out.println("속도 감소");
				speed--;
			} else if (str.equals("정지")) {
				System.out.println("정지(속도=0)");
				speed = 0;
				run = false;
			}
			System.out.println("현재속도= " + speed);
		}
		sc.close();

	}

}
