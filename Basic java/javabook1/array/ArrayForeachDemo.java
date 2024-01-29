package javabook1.array;

public class ArrayForeachDemo {

	public static void main(String[] args) {
		// 문제1: 다음 표시된 국가를 저장하는 배열을 생성하시오
		
		String[] country = {"미국", "일본", "호주", "홍콩"};
		
		// 문제2: 생성한 배열에서 호주만 찾아 출력해라
		
		System.out.println(country[2]);
		
		// 문제3: 배열내용 전체를 출력해라 - for문사용
		
		for(int i =0; i<4; i++) {
			System.out.println(country[i]);
		}
		
		//문제4: 각 국가별 금일 환율을 저장하는 배열을 생성 및 출력해라
		
		String[][] Exchange = {
				{"*국가", "*오늘의 환율"},
				{"미국", "1300"},
				{"일본", "1000"},
				{"호주", "900"},
				{"홍콩", "1100"}
		};
		
		System.out.println(Exchange[0][1]);
		System.out.println("=============================");
		
		for(int i=0; i<2; i++) {
			for(int s=0; s<5; s++) {
				System.out.println(Exchange[s][i]);
			}
		}
		
//		for(int i=0; i<5; i++) {
//			System.out.println(Exchange[i][0]);
//		}
//		for(int i=0; i<5; i++) {
//			System.out.println(Exchange[i][1]);
//		}
		
		
		
		
	}

}
