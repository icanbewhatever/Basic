package javabook2.ch05.array.copy;

public class ArrayCopy {

	public static void main(String[] args) {
		
		int[] oldIntArr = {1,2,3};	  // 값 목록으로 배열 생성
		int[] newIntArr = new int[5]; // 공간을 5개(00000) 준다, new 연산자로 배열 생성
		
		for (int i = 0; i<newIntArr.length; i++) {
			System.out.println(newIntArr[i] + " ");
		}
		
		System.out.println();
		// arraycopy(이전배열, 위치,새배열, 위치, 복사길이)
		System.arraycopy(oldIntArr, 0, newIntArr, 0, oldIntArr.length);   //system.arr 컨트롤+스페이스

		for(int i=0; i<newIntArr.length; i++) {
			System.out.println(newIntArr[i] + " ");
		}
	}

}
