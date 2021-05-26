package free;

public interface RemoteControl {
	
	public int MAX_VOLUME = 10;
	public int MIN_VOLUME = 1;
	
	public void turnOn();
	public void turnOff();
	public void setVolume(int volume);
	
}
