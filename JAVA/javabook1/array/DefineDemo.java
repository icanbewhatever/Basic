package javabook1.array;

public class DefineDemo {

	public static void main(String[] args) {
		// 문제: 프로젝트 팀원의 이름을 저장하는 배열을 생성하시오
		
		String[] book_team = {"조다혜", "이현주"			
		};
		
		
//		System.out.println(book_team[0]);
//		System.out.println(book_team[1]);

		
		// 문제: 프로젝트 팀원의 이름을 저장한 배열을 for문으로 출력하시오
		for(int i = 0; i<2; i++) {
			System.out.println(book_team[i]);
		}
		
	System.out.println("=======================");	
		// 문제: 프로젝트 팀원의 이름과 성별을 저장하는 배열을 생성하시오
		
		String [][] Book_team = {
				{"이름", "성별"},
				{"이현주", "여자"},
				{"조다혜", "여자"}
		};
		
//		new연산자를 쓸 경우
		System.out.println("======new연산자=========");	
		String[][] Book_team2 = new String[3][2];
		
		Book_team2[0][0] = "이름";
		Book_team2[0][1] = "성별";
		Book_team2[1][0] = "이현주";
		Book_team2[2][0] = "조다혜";

		System.out.println(Book_team2[0].length); // 팀2[0]은 두개다
		
		System.out.println("======new연산자 for문=========");	
		for(int i=0; i<Book_team2[0].length; i++) {
			System.out.println(Book_team2[0][i]);
		}
		
		
		// 문제: 프로젝트 팀원을 저장한 배열에서 자신의 이름만 출력하시오
		
		System.out.println(Book_team[1][0]);
		System.out.println("=======================");	

		for(int i = 0; i<3; i++) {
			System.out.println(Book_team[i][0]);
		}
		System.out.println("========length=======");
		
		System.out.println(Book_team.length);
		for(int s = 0; s<Book_team.length; s++) {
			System.out.println(Book_team[s][1]);
		}
		
		System.out.println("==========last=============");	

		for(int i = 0; i<2; i++) {
			for(int s = 0; s<3; s++) {
				System.out.println(Book_team[s][i]);
			}
		} 		
		
	}

}
