package javabook2.ch05.sec_enum;

import java.util.Scanner;

public class MonthExampleScanner {

	public static void main(String[] args) {

		Scanner sc = new Scanner (System.in);
		
		System.out.println("월을 숫자로 입력하세요:");
		int month = sc.nextInt();
		
		
		switch(month) {
		case 11:
			System.out.println("DB_NOV");
			break;
		case 12:
		System.out.println("Java_DEC");
		break;
		case 1:
		System.out.println("HTML_JAN");
		break;
		case 2:
			System.out.println("JSP_FEB");
			break;
		case 3:
			System.out.println("스마트펙토리_MAR");
			break;
		case 4:
			System.out.println("SPRING_APR");
			break;
		}
		

	}

}
