package javabook2.ch08.sec03;

public class ZooKeeper {// 사육사
	//필드선언
	String name;
	
	//생성자선언
	public ZooKeeper(String worker) {
		this.name = name;
		System.out.println("이름 " +worker );
	}
	
	//메서드
	public static void main(String []args) {
		 
		 Animal animal = new Animal("사자");
		 animal.eat();
	//	 [필드 재할당]
		 animal.name = "오리";
		 animal.eat();
		
	//	객체생성
		ZooKeeper luna = new ZooKeeper("루나"); 
		Lion lion = new Lion(animal.name); 
			 
		luna.feed(lion);
		//[인터페이스 사용] 사자에게 육식 기능 부여
		
		Carnivore carnivore;
		carnivore = lion;
		carnivore.eatMeat();
		carnivore.run();
		
		FastRuning fastRuning;
		fastRuning = lion;
		fastRuning.runFast();
}
	//메서드 선언 먹이주다
	void feed(Lion lion) {
		System.out.println("먹이 주다");
		lion.eat();
	}
}
