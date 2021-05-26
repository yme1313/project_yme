package free;

public class SmartTelevisionExample {

	public static void main(String[] args) {
		SmartTelevision tv = new SmartTelevision();
		RemoteControl rc = tv;
		Searchable sc = tv;
		
		rc.turnOn();
		rc.setVolume(6);
		rc.turnOff();
		
		sc.search("naver.com");
	}

}
