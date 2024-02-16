package javabook2.ch06.sec10;

//한국인 라이브러리 클래스
public class Korean {
	
//	필드(속성)
	
	final String nation = "대한민국"; //국적 고정
	final String ssn;
	String name;
	
	//생성자
	
	Korean(String ssn){
		this.ssn = ssn;
	}
}
