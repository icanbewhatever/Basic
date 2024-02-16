package javabook2.ch07.sec10.animal;

public abstract class Animal {
//	특징: 추상메서드 선언시, 중괄호 블럭이 없다 > 자식 클래스의 메서드에게 책임 진가
//	추상메서드는 추상클래스 내 선언
	//메서드
	//소리내다
	abstract void sound(); 
	//추상적이라서 동작할 수 없다, 자식에게 오버라이딩한다
	//부모에 추상메서드가 있다면, 자식에게도 써 줘야 한다
	
	//점프하다
	abstract void jump();
}
