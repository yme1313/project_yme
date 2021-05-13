package day13;

public class Circle extends Figure {
	private int x;
	private int y;
	private int r;
	
	public Circle(int x,int y, int r) {
		super(x-r , y-r , x+r , y+r);
		this.x=x;
		this.y=y;
		this.r=r;
	}
	@Override
	public void print() {
		System.out.println("<<원입니다>>");
		System.out.println("중심점 : " + x + "px, " + y + "px" );
		System.out.println("반지름 : " + r );
	}
}
