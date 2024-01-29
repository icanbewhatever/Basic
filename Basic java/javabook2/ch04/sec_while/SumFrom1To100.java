package javabook2.ch04.sec_while;

public class SumFrom1To100 {

	public static void main(String[] args) {
		// 문제 1부터 100까지 합 구하기(while문 사용)
		
		int sum = 0;
		
//		sum +=1; // sum+1;			debugging 오류있는지 확인
//		System.out.println(sum);
//		sum +=2; // sum+1+2;
//		System.out.println(sum);
//		sum +=3; // sum+1+2+3;
//		System.out.println(sum);
//		
		
		int  i = 0;		//변수초기화
		while(i<=100) {
			sum += i;
			System.out.println(i); 	 //1 2 3
			System.out.println(sum); //1 3 6
			i++; //위에 쓰면 값이 달라진다
		}
			System.out.println("합: " +sum);
		
	}

}
