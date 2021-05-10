package day10;
/* 
직각사각형을 나타내는 클래스 : Rect
- 멤버변수 : 왼쪽위의 점 =>leftUp, 오른쪽 아래점=>rightDown, 너비=> int width, 높이 => int height
- 메소드  : 출력기능
*/
public class Rect {
	private Point leftUp;
	private Point rightDown;
	//너비, 높이
	private int width,height;
	/* 기능	 : 사각형의 정보를 출력하는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : pirnt 
	 * */
	public void print() {
		System.out.print("왼쪽 위 점: " );
		leftUp.print();
		System.out.print("오른쪽 아래 점: ");
		rightDown.print();
		System.out.println("너비 : "+ width);
		System.out.println("높이 : "+ height);
	}
	/* 기능   : 주어진 좌표로 왼쪽 위의 점을 이동시키는 메소드
	 * 매개변수 :
	 * 리턴타입 : 없음
	 * 메소드명 : move 
	 *  */
	
	/* 기본 생성자 : 왼쪽위의 점을 나타내는 객체를 생성, 오른쪽 위의 점을 나타내는 객체 생성*/
	public Rect() {
		leftUp = new Point();
		rightDown = new Point();
	}
	/* 생성자 : 좌상점과 우하점이 주어지면 해당 점을 이용항 사각형이 되도록 초기화 
	 * 매개변수 : 매개변수 좌상점과 우하점,너비와 높이
	 */
	public Rect(int left,int right,int up,int down) {
		leftUp = new Point(left,up);
		rightDown = new Point(right,down);
		width = right - left;
		height = up - down;
	}
	public Rect(Point lu,Point rd) {
		leftUp = lu;
		rightDown = rd;
		width = rightDown.getX() - leftUp.getX();
		height = leftUp.getY() - rightDown.getY();
	}

	public Point getLeftUp() {
		return leftUp;
	}
	public void setLeftUp(Point leftUp) {
		this.leftUp = leftUp;
	}
	public Point getRightDown() {
		return rightDown;
	}
	public void setRightDown(Point rightDown) {
		this.rightDown = rightDown;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
}
