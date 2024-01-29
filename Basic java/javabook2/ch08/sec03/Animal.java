package javabook2.ch08.sec03;
//추상적
public class Animal {
	//[필드 선언]
	String name;
	
	//[생성자 초기화]
	public Animal() {
	} //기본생성자 -- 오버로딩

	public Animal(String name) {
		this.name = name;
	}
	//[메서드 선언]
	//먹다
	void eat (){
		System.out.println(name + "가 먹다");
	}
	
}
