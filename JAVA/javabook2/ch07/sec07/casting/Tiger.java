package javabook2.ch07.sec07.casting;
//Surveclass
public class Tiger extends Animal {
	//필드
	//생성자
	//메서드
//	오버라이딩
	@Override
	public void eat() {
		System.out.println("사냥해서 먹다");
	}
//	소리를내다
	public void sound() {
		System.out.println("어흥");
	}
}
