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
	 * 매개변수 : x축 좌표와 y축 좌표
	 * 리턴타입 : 없음
	 * 메소드명 : move 
	 *  */
	public void move(int x1, int y1) {
		//왼쪽 위의 점을 이동
		leftUp.move(x1,y1);
		//오른쪽 아래의 점을 이동
		//x1을 기준으로 너비만큼 더해주고 y1을 기준으로 높이만큼 빼주면 됨
		rightDown.move(x1+width,y1-height);
	}
	/* 기능 : 왼쪽 위의 점을 기준으로 사각형의 너비와 높이를 변경하는 메소드
	 * 매개변수 : 왼쪽 위의 점 좌표와 변경할 너비와 높이 => int left, int right, int w , int h // 강사 : 너비와 높이 만 활용
	 * 리턴타입 : 없음
	 * 메소드명 : resize
	public void resize(int left, int right, int w,int h) {
		width =  left - w;
		height = right - h;
	} 
	 */
	public void resize(int w, int h) {
		//너비와 높이를 수정
		width = w;
		height = h;
		rightDown.move(leftUp.getX()+w, leftUp.getY()-h);
		
	}
	
	
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
		//leftUp = lu; // lu와 leftUp은 같은 정보를 공유
		//rightDown = rd; // rd와 rightDown은 같은 정보를 공유
		leftUp = new Point(lu);
		rightDown = new Point(rd);
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
