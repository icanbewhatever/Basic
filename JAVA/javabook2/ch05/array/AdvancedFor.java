package javabook2.ch05.array;

import java.util.Scanner;

public class AdvancedFor {

	public static void main(String[] args) {
		// 향상된 for문
		
//		for(타입변수 변수명 : 배열) {
//			실행문;
//		}
		
		int[]  scores = {96, 71, 84, 93, 87};
		
		for(int score : scores) {
			System.out.print(score +" ");
		}
		
//		String[] tripTo = {"제주도", "부산", "여수", "독도", "울릉도"};
//		
//		for(String area : tripTo) {
//			System.out.println(area);
//		}
//		
//		Scanner sc = new Scanner(System.in);
		
		String[] travelAreas = new String[10];  // 기본 str1에서 바꾼다
				
		Scanner sc = new Scanner(System.in);
		
		System.out.println("가고싶은 여행지는?");
		String travelArea = sc.nextLine();		// 앞에 왜 변수 String을 넣어주지?
		System.out.println();
		
		travelAreas [0] = travelArea;
		
		System.out.println("===========배열데이터입력전");
		for(String area : travelAreas) {
			System.out.println(area);
		}
		
		sc.close();
		
		
	}

}
