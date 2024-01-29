package javabook2.ch07.sec10.animal;

public class Cat extends Animal {
	//메서드
	@Override
	void sound() {
		System.out.println("야옹");
	}
		@Override
	void jump() {
		System.out.println("고양이가 점프하다");
	}
}
