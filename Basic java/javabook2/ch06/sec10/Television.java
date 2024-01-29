package javabook2.ch06.sec10;

public class Television {

	//필드(속성)
	static String company = "LG";
	static String model = "LCD";
	static String info ="1234";
	
//	시리얼 번호 LGLCD-1234
	
	static String serialNum = company+model+"-"+info;
	
	
	//정적필드
	static {
		serialNum = company+model+"-"+info;
	}
}
