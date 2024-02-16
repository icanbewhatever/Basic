package javabook2.ch08.sec01;

public class Radio implements RemoteControl{
	int volum;
	
	@Override
	public void turnOn() {
		System.out.println("라디오 켜다");
	}
		
	@Override
	public void turnOff() {
		System.out.println("라디오 끄다");
	}

	@Override
	public void channer(int num) {
		System.out.println("라디오 채널" +num);
		
	}

	@Override
	public void setVolum(int volum) {
		if(volum > MAX_VOLUME) {
			this.volum = MAX_VOLUME;
		}else if (volum < MIN_VOLUME) {
			this.volum = MIN_VOLUME;
		}else {
			this.volum =volum;
		}
		System.out.println("현재 라디오 볼륨: "+ this.volum);
		
	}
}
