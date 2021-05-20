package free;

public class SuperSonicAirPlaneExample {

	public static void main(String[] args) {
		SuperSonicAirPlane sa = new SuperSonicAirPlane();
		sa.takeOff();
		sa.fly();
		sa.flymode = SuperSonicAirPlane.SUPPERSONIC;
		sa.fly();
		sa.flymode = SuperSonicAirPlane.NOMMAL;
		sa.fly();
		sa.land();

	}

}
