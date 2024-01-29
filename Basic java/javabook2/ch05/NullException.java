package javabook2.ch05;

public class NullException {

	public static void main(String[] args) {
		// null 값으로 초기화
		
		String str1;
		String str2 = null;
		
//		1.초기화 하지않은 참조변수는 사용불가
//		System.out.println(str1);  
		System.out.println(str2); //n  +ull로 초기화한 참조변수는 사용가능
	
		
//		여러개로 변수 정수값을 넣어줬는데, 한번에 넣어줄 수는 없을까??
//		int a = 1;
//		int b = 2;
//		int c = 3;
//		int d = 4;
//		int e = 5;
//		다섯개의 값을 하나로 표현할 수 있다 > 배열 Array: 참조타입변수
//		타입[] 변수명 =  {값1, 값1..} 배열 변수 선언 + 할당
		int[] a = {2,9,3,4,5};	//배열로 선언된 a 값
		
		
//		변수명[인덱스] : 값을 하나만 꺼내서 사용 - index
//		Index란, 특정 값을 가리키는 정수.
//		a[0] > a의 첫번째 값을 가르킨다 1
				
		System.out.println(a[0]);  //int[] a 의 첫번째 값
		System.out.println(a[1]);  //int[] a 의 두번째 값

		int c;
		c =20;
		
	 // 2.null 값으로 초기화한 배열 객체에 값을 할당 불가
		int[] b = null;
//		b[0] = 10;		//예외발생
//		System.out.println(b[0]); // Cannot store to int array because "b" is null
		
		String str4 = "abc";
		System.out.println("문자열 길이:"+ str4.length());
		
		
//		3. null 값으로 초기화한 객체의 값을 사용 불가
		String str3 = null;
//		str3.length();	문자열 길이 변환 함수
		System.out.println("문자열 길이:"+ str3.length()); //Cannot invoke "String.length()" because "str3" is null
		
		
	
		
	}

}
