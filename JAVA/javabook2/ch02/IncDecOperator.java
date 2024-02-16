package javabook2.ch02;

public class IncDecOperator {

	public static void main(String[] args) {
		/* 
		증감연산자 
		++값 > 값 +1
		--값 > 값 -1 
		값++ > 타 연산 수행후, 값 +1
		값-- > 타 연산 수행후, 값 -1 
		*/
		
		int x1 = 10;
		int y1 = 10;
		int z1;
		
		System.out.println("x1=" + x1);
		System.out.println("y1=" + y1);
		System.out.println("================================");		
//		++x1;
//		--y1;
		
//		x1++; //단독으로 사용했을땐, ++값과 같지만, 다른 연산자(z1)와 쓸 때는 다르다
//		y1--;
		
//		z1 = ++x1;   // z1 = x1 + 1
		z1 = x1++;   // z1 = x1 + 1
		System.out.println("z1 =" + z1); //++z1는 10, z1++는 10
		
//		z1 = --y1;	 // z1 = y1 - 1
		z1 = y1--;	 // z1 = y1 - 1
		System.out.println("z1 =" + z1); //--y1는 9, y1--는 10	
		
		
		
		
		System.out.println("================================");
		System.out.println("x1=" + x1); 
		System.out.println("y1=" + y1);
	}

}
