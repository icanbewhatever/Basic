package javabook2.ch04.sec_switch;

public class SwitchString {

	public static void main(String[] args) {
		
		
		// 문제: 회사의 직급에 따라 급여 차이를 표시하는 프로그램 작성
		
		String position = "사장";
		
		switch(position) {
		
		case "사원":
			System.out.println("200만원");
		break;
		case "대리":
			System.out.println("300만원");
		break;
		case "과장":
			System.out.println("400만원");
		break;
		case "차장":
			System.out.println("500만원");
		break;
		case "부장":
			System.out.println("600만원");
		break;
		default:
			System.out.println("1000만원");
		
		}

	}

}
