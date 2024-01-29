package javabook2.ch07.sec08.car;
//금호타이어 클래스 : 자식
public class KumhoTire extends Tire {
	@Override
	public void roll() {
		System.out.println("한국타이어가 회전한다");
	}
}
