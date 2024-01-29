package javabook2.ch02;

public class Promotion {

	public static void main(String[] args) {
		// 자동형변환(Promotion) = 묵시적형변환
		
		byte byteVal = 3;
		System.out.println(byteVal);
		
		int inVal = byteVal; //int <= byte  int가 byte보다 큰 타입
		System.out.println(byteVal);
		
		// 강제적형변환(Casting) = 명시적형변환
		int intVal1 =  44032;
		System.out.println(intVal1);
		// 작은타입 = (작은타입)큰타입
		char charVal = (char)intVal1; // char <= int  char은 int보다 작다
		System.out.println(charVal);
		
		short shortVal = (short)intVal1; // short <= int
		System.out.println(shortVal);	
	}

}
