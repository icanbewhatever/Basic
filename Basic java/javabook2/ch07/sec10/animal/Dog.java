package javabook2.ch07.sec10.animal;

public class Dog extends Animal{
	//메서드
	@Override
	void sound() {
		System.out.println("멍멍");
	}
	@Override
	void jump() {
		System.out.println("강아지가 점프하다");
	}	
}
