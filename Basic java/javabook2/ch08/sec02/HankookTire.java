package javabook2.ch08.sec02;
//라이브러리 클래스 구현클래스
//구체적인 내용
public class HankookTire implements Tire {
	//필드
	//생성자
	//메서드
	@Override
	public void roll() {
		System.out.println("한국타이어가 회전한다");
		System.out.println("빗길에 강하다");
	}
}
