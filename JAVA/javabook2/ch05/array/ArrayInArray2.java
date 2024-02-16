package javabook2.ch05.array;

public class ArrayInArray2 {

	public static void main(String[] args) {
		// 변수타입 [][] 변수명 = new 변수타입[행길이][열길이];
		
		int [][] iArr1 = new int[2][3]; // 2x3 = 6의 데이터를 저장할 수 있다
		
		iArr1[0][0] = 10; //0의 0열의 값을 넣겠다
//		iArr1[0][1] = 20; 값 할당을 안하면 0으로 된다, 정수는 0으로 초기화
		iArr1[0][2] = 30;
		
//		System.out.println(iArr1[0][0]);
//		System.out.println(iArr1[0][1]);
//		System.out.println(iArr1[0][2]);
//		위와 같다
		for(int i=0; i<3; i++) {
			System.out.println(iArr1[0][i]);
		}
		
		iArr1[1][0] = 40; 
		iArr1[1][1] = 50;
		iArr1[1][2] = 60;
		
//		System.out.println(iArr1[1][0]);
//		System.out.println(iArr1[1][1]);
//		System.out.println(iArr1[1][2]);
		
		
		for(int i=0; i<3; i++) {
			System.out.println(iArr1
					[1][i]);
		}
		
		System.out.println("=====================");
//		i -> 0
//		j -> 0
		
		for(int j=0; j<2; j++) {
			for(int i=0; i<3; i++)
			System.out.println(iArr1[j][i]);
		}
		
	}

}
