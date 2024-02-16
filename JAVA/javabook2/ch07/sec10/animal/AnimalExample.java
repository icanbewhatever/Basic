package javabook2.ch07.sec10.animal;

public class AnimalExample {

	public static void main(String[] args) {
		
		//추상클래스의 객체생성 불가
		//자식클래스의 객체생성 가능
		Dog dog = new Dog();
		dog.sound();
		dog.jump();
		
		System.out.println("==============");
		Cat cat = new Cat();
		cat.sound();
		cat.jump();
		
		animalSound(dog);
		animalSound(cat);
		
		
	}
//Main() 함수에서 메서드 사용시 static을 붙이는 이유
//	정적메서드에서는 인스턴스 멤버를 사용 불가
//	인스턴스 메서드를 사용하려면, 객체를 생성해야하는데
//	편의상 추가적인 코드가 필요하고 공통적으로 사용하는 메서드이므로
//	static을 붙이는 것이 좋다
	
	//메서드 선언
	
//	Animal animal = dog; //자동형변환: 부모메서드 사용가능

	//void 만 넣을경우 객체를 만들 수 없다
	//static를 편의상 쓴 것
//	static은 클래스에 저장 다른클래스에서 쓸땐 클래스명.
//	static을 빼면 (클래스명)AnimalExample.animalSound(cat); 길다
	static void animalSound(Animal animal) {
		// String animal로 넣을 수 있지만 클래스타입을 넣는다
		animal.sound(); //main 안에서 호출
	
	}
}
