package javabook2.ch06.sec06;

public class Car {
	
	//필드
	
	String model;
	String company;
	int year;
	
	//생성자
	//(필드)초기화 목적의 생성자를 선언
	//외부클래스(실행)에서 초기화 하지 않겠다	
	// company 모양의 틀에 넣겠다
	
	public Car(String company, String model){
		this.company = company;
		this.model = model;
	}
//	각자 객체에 갖고있는 내용들을 저장한다
	
	public Car(String company) {
		this.company = company;
	}
	
	public Car(int year) {
		this.year = year;
	}
}
