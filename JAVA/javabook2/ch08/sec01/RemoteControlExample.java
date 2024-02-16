package javabook2.ch08.sec01;
//실행클래스
public class RemoteControlExample {

	public static void main(String[] args) {
		//리모콘 기능을 활용해 티비를 켜다.
		//--> 인터페이스의 메서드를 활용해 클래스의 메서드를 수행한다
		
		RemoteControl rc = new Television();
//		리모콘 기능을 사용하면 티비가 작동하기 때문에 
		
		rc.turnOn();
		rc.channer(11);
		rc.setVolum(5);
		rc.turnOff();
		System.out.println("===============");
		
//		리모콘 기능을 사용하면 라디오 작동하기 때문에 
		rc = new Radio();
		rc.turnOn();
		rc.channer(11);
		rc.setVolum(6);
		rc.turnOff();
		
		System.out.println("===============");
		
		rc.useInternet();
		rc.setMute(true);	//무음 처리하다
		rc.setMute(false);	//무음 해제하다
		
		RemoteControl.changeBattery(); //배터리를 교체하다
	}
}
