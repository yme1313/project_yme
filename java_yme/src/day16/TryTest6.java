package day16;

public class TryTest6 {

	public static void main(String[] args) {
		int arr [] = new int[5];
		try {
			setData(arr, 0, 10);
			int num= getData(arr, 0);
			System.out.println(num);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("프래그램 종료");
	
		
		
		
	}
	/* 기능 : 정수형 배열 index번지에 있는 값을 data로 설정하는 메소드
	 * 매개변수 : 배열, 번지 ,값 int arr[] ,int index , int data
	 * 리턴타입 : 없음 void
	 * 메소드명 : setData
	 * */
	public static void setData(int arr[],int index, int data) 
			throws RuntimeException{
			if(arr == null) {
				throw new NullPointerException("배열이 생성되지 않았습니다.");
			} 
			if(index < 0 || index >= arr.length) {
				throw new ArrayIndexOutOfBoundsException(index + "번지는 "+arr.length+"개짜리 배열에서 유효하지 않은 배열의 번지입니다.");
			} arr[index] = data;
	}
	
	
	/* 기능 : 정수형 배열에 index번지에 있는 값을 가져오는 메소드
	 * 매개변수 : 배열, 번지 int arr[] ,int index 
	 * 리턴타입 : 값 => 정수 int
	 * 메소드명 : getData
	 * */
	public static int getData(int arr[], int index) 
			throws RuntimeException{
			if(arr == null) {
				throw new NullPointerException("배열이 생성되지 않았습니다.");
			} 
			if(index < 0 || index >= arr.length) {
				throw new ArrayIndexOutOfBoundsException(index + "번지는 "+arr.length+"개짜리 배열에서 유효하지 않은 배열의 번지입니다.");
			} return arr[index];
	}
}
