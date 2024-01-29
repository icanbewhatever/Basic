package javabook1.array;

public class ArrayForeachDemoNew {

	public static void main(String[] args) {
		//풀이과정
		// 문제1: 다음 표시된 국가를 저장하는 배열을 생성하시오

		String[] countries;			//배열선언
		countries =  new String[5];	//배열할당(공간)
		
		countries[0] = "미국";
		countries[1] = "일본";
		countries[2] = "호주";
		countries[3] = "홍콩";
		
		// 문제2: 생성한 배열에서 호주만 찾아 출력해라
		System.out.println(countries[2]);
		
		
		// 문제3: 배열내용 전체를 출력해라 - for문사용 +++++
		for(String country : countries) {
			System.out.println(country);
		}
		
		//문제4: 각 국가별 금일 환율을 저장하는 배열을 생성 및 출력해라
		
		String[][] ExchangeRate = {
				{"미국", "1294"},
				{"일본", "914"},
				{"호주", "870"},
				{"홍콩", "164"}
		};
		
		
		System.out.println(ExchangeRate[0][0] +" " + ExchangeRate[0][1]);
		
		
		System.out.println("======FOR문 활용======");
		for(String data1 : ExchangeRate[0]) {
			System.out.println(data1);
		}

	}

}
