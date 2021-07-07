package free;

public class DmbCellPhoneExample {

	public static void main(String[] args) {
		
		DmbCellPhone dmb = new DmbCellPhone("자바폰", "검정", 10);
		
		System.out.println("모델: " + dmb.model);
		System.out.println("색상: " + dmb.color);
		System.out.println("채널: " + dmb.channel);
		
		dmb.powerOn();
		dmb.bell();
		dmb.sendVoice("여보세요");
		dmb.receiveVoice("누구세요?");
		dmb.sendVoice("안녕히 계세요.");
		dmb.hangUp();
		
		dmb.turnOnDmb();
		dmb.changeChannelDmb(12);
		dmb.turnOffDmb();
		
	}
}
