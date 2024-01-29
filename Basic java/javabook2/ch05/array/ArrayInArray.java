package javabook2.ch05.array;

public class ArrayInArray {

	public static void main(String[] args) {
		// 2차원 배열
		
		
		int[] iarr1 = {1,2,3};		//1차원 배열 선언과 할당
		
//		1. null 초기화
		String[][] sArry3 = null;
		
//		2. 값 목록으로 초기화
		int[][]iarr2 = {			//2차원 배열 선언과 할당
				{10,11,12}, 	// 10번지 (11번지,12번지, 13번지)
				{20,21}, 		// 20번지 (21번지,22번지)
				{30, 31, 32}	// 30번지	 (..랜덤유형, 실제로는 알 수없다, 알 필요 없음)
		};
		
//		3. new 연산자 초기화
//		String[][] sArry2 = new 타입 [길이1] [길이2];
		String[][] sArry2 = new String[3][3];
		
		
	}

}
