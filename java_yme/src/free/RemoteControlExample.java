package free;

public class RemoteControlExample {

	public static void main(String[] args) {
		RemoteControl rc;
		RemoteControl rc1;
		rc = new Television();
		rc.turnOn();
		rc.setVolume(5);
		rc.turnOff();
		System.out.println("------------------------");
		rc1 = new Audio();
		rc1.turnOn();
		rc1.setVolume(2);
		rc1.turnOff();

	}

}
