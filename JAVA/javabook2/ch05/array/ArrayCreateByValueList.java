package javabook2.ch05.array;

public class ArrayCreateByValueList {

	public static void main(String[] args) {
		
		
		int[] scores = {83,90,87}; // 배열선언
		System.out.println("scores[0] = " +scores[0]);
		System.out.println("scores[1] = " +scores[1]);
		System.out.println("scores[2] = " +scores[2]);

		int sum = scores[0] + scores[1] + scores[2];
		System.out.println(sum);
		
		System.out.println("=================");
		
		for(int i=0; i<3; i++) {
			System.out.println(scores[i]);
		}
//		왜 숫자가 아닌 length를 쓰나?
		System.out.println("======length=======");
		for(int i=0; i<scores.length; i++) {
		System.out.println(scores[i]);
	}
		
		
		double avg = (double)sum/3;
		System.out.println(avg);
		
		System.out.println("=================");
				
		String[] season = {"spring", "summer", "fall", "winter"};
		
		
		System.out.println(season[0]);
		System.out.println(season[1]);
		System.out.println(season[2]);
		System.out.println(season[3]);
		
		System.out.println("=================");
		
		
		
		for(int i=0; i<season.length; i++) {
			System.out.println(season[i]);
		}
		
				
		System.out.println("=================");
		
		boolean[] year = {false, true, false};
		
		System.out.println(year[0]);
		System.out.println(year[1]);
		System.out.println(year[2]);
		
//		배열 길이를 확인하려면, > 변수명.length
		System.out.println(year.length);
		
		for(int i=0; i<year.length; i++) {
			System.out.println(year[i]);
		}
		
	}

}
