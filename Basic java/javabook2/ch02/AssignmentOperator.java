package javabook2.ch02;

public class AssignmentOperator {

	public static void main(String[] args) {
		// 이항연산자 > [복합]대입연산자
		int result = 0;
		
//		변수 += 값;
	 result += 10;
	 System.out.println(result);
//	    변수 -= 값;
	 result -= 5;
	 System.out.println(result);
//		변수 *= 값;
	 result *= 3;
	 System.out.println(result);
//	    변수 /= 값;
	 result /= 5; 
	 System.out.println(result);
//	 변수 %= 값;
	 result %= 3;
	 System.out.println(result);
	 
	 
//	 삼항(조건)연산자
//	 조건? 값1 : 값2
			 
	int score = 85;
	
	char grade = (score > 90) ? 'A' : 'B';
	
	System.out.println(grade); 
	 
	 
	 
	 
	 
	 
	 
	}

}
