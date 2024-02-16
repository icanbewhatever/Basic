package javabook2.ch04.sec_switch;

public class SwitchExample {

	public static void main(String[] args) {
		

		int num;		//변수선언 
		num = 3;		// break 있어도없어도 4를 넣으면 모두 값이 나오지만 2를 넣으면 마지막 값만 출력된다, why?
						// break; 를 case구문에 각각 넣을경우 해당 값만 출력된다
		
//		switch - case문		
		switch(num){
			
			case 1:
				System.out.println("1");
				
			case 2:
				System.out.println("2");
				
			case 3:
				System.out.println("3");
				break;
			case 4:
				System.out.println("4");
			break;
		}

	}

}
