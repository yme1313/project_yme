package free;

public class Car {
	//Field
	private int speed;
	private boolean stop;
	
	
	//Method
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		if(speed <0) {
			return;
		} else {
			this.speed = speed;
		}
	}
	public boolean isStop() {
		return stop;
	}
	public void setStop(boolean stop) {
		this.stop = stop;
		if(stop = true) {
			speed=0;
		}
	}
	
	
}
	

