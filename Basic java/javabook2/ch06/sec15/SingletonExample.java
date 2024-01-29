package javabook2.ch06.sec15;

public class SingletonExample {

	public static void main(String[] args) {
		
//		Singleton single = new Singleton();
		
		Singleton single = Singleton.getInstance();
		Singleton single1 = Singleton.getInstance();
		Singleton single2 = Singleton.getInstance();
	// 같은 객체(번지)를 사용

	
	
	single.num =10;
	System.out.println(single.num);
	
	single.func();
	
	}

}
