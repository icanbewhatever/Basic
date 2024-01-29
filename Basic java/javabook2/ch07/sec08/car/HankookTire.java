package javabook2.ch07.sec08.car;
//한국타이어 클래스 : 자식
public class HankookTire extends Tire {
	@Override
	public void roll() {
		System.out.println("한국타이어가 회전한다");
	}
}
