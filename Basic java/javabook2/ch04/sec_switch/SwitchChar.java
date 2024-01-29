package javabook2.ch04.sec_switch;

import java.util.Scanner;

public class SwitchChar {

	public static void main(String[] args) {
//		1문제: 점수를 입력받아 성적 등급을 부여하는 프로그램을 작성해라 (switch문, 등급변수 int 사용) 
//		hint: Scanner 입력사용, 점수 영역별 등급 산정(ex 90점대/A, 80점대/B...)
//		99~90 / 89~80
			
		Scanner sc = new Scanner(System.in);	// 자바 함수 입력 숫자
		
		System.out.println("점수입력: ");
		int score = sc.nextInt();	//정수로 입력 int score = sc.nextInt(score/10); or 변수 재할당
		score = score/10;		// score /=10 와 같다
		
		System.out.println(score);  // 체크
		
		sc.close(); 
		
			
		switch (score) {
			case 10:	// break 가 없는 경우 해당되는 case는 모두 수행			
			case 9:
				System.out.println("A");
			break;
			case 8:
				System.out.println("B");
				break;
			case 7:
				System.out.println("C");
				break;
			default:
				System.out.println("F");
			
		}
		
//		2문제: 점수를 따라 부여된 등급을 char 변수로 사용해 재수강 여부를 결정하는 switch문을 작성해라
		
		char grade;		//char 사용시 '변수값'은 작은 따옴표 변수선언
		
		switch (score) {
			case 10:
			case 9:
				grade = 'A';
			break;			
			case 8:
				grade ='B';
			break;	
			case 7:
				grade = 'C';
			break;	
			default:
				grade = 'F';
			break;	
		}
		
		System.out.println(grade);	//맨 마지막에 써줘도 된다
		
		switch (grade) {
		
		case 'F':
			grade = 'F';		//변수할당
			System.out.println("재수강 필요");
			break;
		default:
			System.out.println("재수강 없음");
			break;
		
		}
		
		
		

	}

}
