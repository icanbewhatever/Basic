package javabook2.ch05.array;

public class ArrayInArray_exam {

	public static void main(String[] args) {
		// 평가예제 : 반별 학생별 점수 생성 및 합계와 평균
		
		int[][] scores = {
				{80,90,96},		//1반 3명
				{76,88}			//2반 2명
		};
		
		//1반에 두번째 학생 점수
		System.out.println(scores[0][1]);
		//2반에 첫번째 학생 점수
		System.out.println(scores[1][0]);
		
		// 중요!!+++++
		System.out.println(scores.length); //1차원으로 볼때 데이터가 2개가 있어서 값은 2가나온다: 1차원 배열길이
		System.out.println(scores[0].length);// 2차원 0번인덱스 배열길(1반 인원수): 3명
		System.out.println(scores[1].length);
		
		System.out.println("1반학생 점수");
		for(int i=0; i<scores[0].length; i++) {
			System.out.println(scores[0][i] + "점");
		}
		
		System.out.println("2반학생 점수");
		for(int i=0; i<scores[1].length; i++) {
			System.out.println(scores[1][i] + "점");
		}
		
		
		//문제: 1반 학생들 점수 총합
		
		int sum = 0;
		for(int i=0; i<scores[0].length; i++) {
//			System.out.println(scores[0][i] + "점");
			sum += scores[0][i];
		}
		System.out.println("1반 총점: " +sum);
		
		float avg1 = sum/3f;
		System.out.println("평균: " +avg1);
	
		//문제: 2반 학생들 점수 총합
		
		int sum2 = 0;
		for(int i=0; i<scores[1].length; i++) {
//			System.out.println(scores[1][i] + "점");
			sum2 += scores[1][i];
		}
		System.out.println("2반 총점: " +sum2);
		
		double avg2 = (double) sum2/2;
		System.out.println("평균: " +avg2);
		
		//문제: 전체 학생들 점수 총합
		
		int total = sum+sum2;
		System.out.println("학생전체 총합: " +total);
		
		System.out.println("====풀이방법====");
		
		int count = 0;
		
		for(int a=0; a<scores[1].length; a++) {		//2번 반복: 행 개수
			for(int b=0; b<scores[a].length; b++) {	//3번 반복: 열 개수
//				System.out.println(scores[a].[b]);
				sum += scores[a][b];					//6명 성적 더하기
//				sum =sum + scores[a][b];
				count++;		
			}
		}
		System.out.println(sum + "점");
		System.out.println(count);
		
		double avg = (double)sum/count;
		System.out.println("평점"+avg);
	
	}

}
