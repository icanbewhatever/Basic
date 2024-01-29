package javabook2.ch04.sec_if;

public class IfNested {

	public static void main(String[] args) {
		int num =1;

	/*	if(num==1) {				//true
			System.out.println("1");
			if(num==2) {			//false
				System.out.println("2");
		} else if(num==3) {			//faㅣse
				System.out.println("3");
		}
		System.out.println("4"); // if문에 영향을 받지 않는다
	
	} else {
//		if(조건식) {		중첩을 여러번 해서 쓸 수 있다
//		
//	} else if(조건식) {
//		
//	} else {
//		
//	}
		
		System.out.println("5");}
*/
		
		
		
		
		if(num==1) {				
			int num1 = 3;	//변수 초기화
			if(num==1) {
				System.out.println("num1:" + num1);
			} else if(num==1) {			
		     	System.out.println("num1:" + num1);	
			} 
		}else {
		
		}
//		if문{부터 }까지를 실행한 후 참일경우, else문은 버려도 된다
//		반대로 거짓일경우, if가 실행되지 않고 else가 실행된다
		
	}
}