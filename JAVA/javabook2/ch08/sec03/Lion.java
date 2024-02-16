package javabook2.ch08.sec03;

public class Lion extends Animal implements Carnivore, FastRuning{

	
	//필드(속성)
	String color = "갈색";
	int age = 4;
	
	//생성자
	public Lion(String name) {
		super(name);
		System.out.println();
	}
	public void Type (String color, int age) {
		this.color = color;
		this.age = age;
	}
	//메서드(기능 동작)
	void sleep() {
		System.out.println(color + age +"살 " +name +"가 잔다");
	}
	@Override
	void eat(){
		System.out.println("사자가 먹다");
	}
	@Override
	public void eatMeat() {
		System.out.println("사자가 육식하다");
	}
	@Override
	public void run() {
		System.out.println("사자가 달린다");
	}
	
}
