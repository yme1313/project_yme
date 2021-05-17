package day15;

public class ArrayIndexOutOfBounsExceptionTest {

	public static void main(String[] args) {
		int [] arr= new int[5];
		for(int i = 0 ; i < arr.length; i++) {
		//5개짜리 배열에 0번지 부터 4번지까지 접근 가능함
		//-1번지 또는 5번지는 없음으로 에러 발생
			System.out.print(arr[i]+" ");
		}
	}
}
