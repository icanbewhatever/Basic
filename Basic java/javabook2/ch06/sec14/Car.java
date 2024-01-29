package javabook2.ch06.sec14;

//라이버리 클래스
public class Car {
	// 필드(속성)

	private String model;
	private String color;
	private int speed = 0;
	private boolean stop = true;

	// 생성자
//	public Car(String model, String color) {
//		this.model = model;
//		this.color = color; //실행클래스에서 입력받는다
//	};

	// 메소드
	// Setter: [set변수명]으로 생성된 메서드
	// Getter: [get변수명], 불리언에서는 [is변수명] 으로 생성된 메서드
//	특징: 1. 필드명에 private 설정
//		 2. 메서드명에 public 설정
	// 실행클래스에서 실행문은 그냥 출력이 안되고 라이브러리에서

//	속도를 측정하다
	public int getSpeed() {
		return speed;
	}

//	엑셀을 밟히다 - 속도를 올리다
	public void setSpeed(int speed) {
		if (speed < 0) {
			this.speed = speed; // 값을 할당
		}
	}

	// 필드의 모델이 프라빗으로 메서드를 통해 실행클래스에서 입력해라
	// Setter: [set변수명]으로 생성된 메서드, 입력된 값을 검증해서 저장할지 말지 확인
	// 모델
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		if (model.equals("자전거")) {
			System.out.println("모델을 잘 못 설정했음");
		} else {
			this.model = model;
		}

	}

	// 컬러
	public String getColor() {
		return color;
	}

	public void setCodel(String color) {
		if (color.equals("red")) {
			System.out.println("빨간색 안됨");
		} else if (color.equals("brown")) {
			System.out.println("갈색 안됨");
		} else {
			this.color = color;
		}

	}

	// 정지여부
	public boolean isStop() {
		return stop;
	}

	public void setStop(boolean stop) {
		this.stop = stop;
//		if (stop == true) this.speed = 0;
	}

}
