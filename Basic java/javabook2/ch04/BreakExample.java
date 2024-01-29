package javabook2.ch04;

public class BreakExample {

	public static void main(String[] args) {
	
		
//		while문 문법
//		변수선언
//		변수할당
//		while(조건식) {
//			실행문;
//			증감식
//		}

		int i=0;
		
		while(i<=10) {
			System.out.println(i);
			i++;
		}
		
//		while값이 참 일때, 위의 int변수값과 증감식이 없어도 된다.
//		while(ture) {
//			System.out.println();
//		}
		
		
		
//		for문 문법
//		
//		for(변수초기화; 조건식; 증감식) {
//			실행문;
//		}
		
//			항상 반복하도록 한다
// 			while(true) {
//			int num =1;	>> 변수를 {}안에 두면 num++을 증가시켜도 다시 1로 초기화되어 출력된 값은 1로 계속 무한반복된다
//			System.out.println(num);
//			num++;
//			여기에 System.out.println(num); 증감식 후에 넣어주면 num가 달라졌는지 확인할 수 있다
//	}
			
			int num = 0;	//변수는 while문 밖에 써준다
			while(true) {
				System.out.println(num);
//				만약 num이 10이 되면 반복문을 빠져나오게 하고 싶다.
				if(num==10){		//특정 반복 조건에서 빠질 수 있게 할 수 있다, 기본적인 if문
					break;
				}
				num++;
			}	
		
		
//		for(int x=10; x>=0; x--) {
//			System.out.println(x);
//		} 
	}

}
