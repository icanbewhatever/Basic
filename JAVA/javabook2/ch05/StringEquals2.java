package javabook2.ch05;

public class StringEquals2 {

	public static void main(String[] args) {
		String name1 = "홍길동";
		String name2 = "임꺽정";	// 힙 영역에 저장
		String name3 = "임꺽정";	//임꺽정을 만든게 있어서 힙 영역을 새로 만들지 않고 기존 내용을 저장
		
		String name4 = new String("임꺽정"); // name3와 다르게 new 연산자를 써서 힙영역에 새로운 개체 생성
		
		if(name2 == name3) {
			System.out.println("name2와 name3 번지값이 같다");
		}else {
			System.out.println("name2와 name3 번지값이 같지않다");
		}
		
		
		if(name3 == name4) { // 값이 같지만 new 연산자로 저장된(힙영역) 위치가 다르다
			System.out.println("name4와 name3 번지값이 같다");
		}else {
			System.out.println("name4와 name3 번지값이 같지않다");
		}
		
		int[] score = {1,2,3,4,5};
		System.out.println(score[2]);
		

		
//		int sum = 0;
//		for(int i=0; i<30; i++) {
//			sum += score[i];
//		}
//		int avg = sum/30;

	}

}
