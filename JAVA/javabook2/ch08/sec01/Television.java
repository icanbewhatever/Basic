package javabook2.ch08.sec01;
// 인터페이스를 구현하는 클래스: 구현클래스
public class Television implements RemoteControl{
	//필드
	int num;
	int volum;
	//생성자(생략)
	
	//메서드
	@Override
	public void turnOn() {
		System.out.println("키다");
	}
//public은 생략가능하지만 쓰지 않는다면 오류발생, 통로가 막혀버린다
// 인터페이스는 두 객체를 연결하는 통로이기 때문에 메서드를 모두 public으로 붙여준다
	
	@Override
	public void channer(int num) {
		this.num =num;
		System.out.println("TV 채널" +num);
	}
	
	@Override
	public void turnOff() {
		System.out.println("TV 키다");
	}

	@Override
	public void setVolum(int volum) {
//만약 리모콘 최대볼륨이 MAX_VOLUME 보다 크면 볼륨을 MAX_VOLUME 값으로 설정하고
//	  리모콘 최소볼륨이 MIN_VOLUME 보다 작으면, 볼륨을 MIN_VOLUME 값으로 설정
//		그렇지않으면, 설정하고 싶은 볼륨을 입력해라.
		if(volum > MAX_VOLUME) {
			this.volum = MAX_VOLUME;
		}else if (volum < MIN_VOLUME) {
			this.volum = MIN_VOLUME;
		}else {
			this.volum =volum;
		}
		System.out.println("현재 TV 볼륨: "+ this.volum);
		
	}
}
