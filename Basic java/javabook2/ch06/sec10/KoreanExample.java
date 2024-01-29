package javabook2.ch06.sec10;

//주민센터 실행 클래스
public class KoreanExample {

	public static void main(String[] args) {

		Korean kim = new Korean("870913-1234567"); //김씨 탄생
		System.out.println(kim.nation);
		System.out.println(kim.ssn);
	
//		kim.nation="영국"; 불가
	
//		System.out.println(kim.ssn);
//		kim.ssn = "870913-5647895" 재할당 불가하다

	javabook2.ch06.sec10.Korean lee = new javabook2.ch06.sec10.Korean("870913-1234568");
	Korean park = new Korean("870913-1234568");
	
	
	}


}

