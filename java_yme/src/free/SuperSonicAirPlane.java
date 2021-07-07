package free;

public class SuperSonicAirPlane extends AirPlane{
	public static final int NOMMAL = 1;
	public static final int SUPPERSONIC = 2;
	
	public int flymode = NOMMAL;
	
	@Override
	public void fly() {
		if(flymode == SUPPERSONIC) {
			System.out.println("초음속비행합니다.");
		} else {
			super.fly();
		}
	}
}

