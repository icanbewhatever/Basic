package javabook2.ch04.sec_for;

public class ForPrint {

	public static void main(String[] args) {

		for(int i=5; i>=0; i--) {
			System.out.println(i);
		}
		System.out.println("========================");		
//		1~15까지 합
		
		int sum = 0;		// sum += 1 > sum = sum + 1
			
		for(int i=1; i<=15; i++) {
			sum = sum + i;
			System.out.println(sum);
		}
		
	
		System.out.println("========================");		

		for(int i=0; i<=10; i=i+2) {
			System.out.println(i);
			}
		
		System.out.println("========================");		
	
		int sum1 = 0;
		int i ;
		
		for(i=1; i<=100; i++) {
			sum1 += i;
			System.out.println(sum1);
		}
		
	}

}
