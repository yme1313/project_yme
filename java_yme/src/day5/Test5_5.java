package day5;

public class Test5_5 {

	public static void main(String[] args) {
		/* 1부터 10사이의 랜덤한 수를 6개 생성하여 배열에 저장한 후 출력하는 코드를 작성하세요.
		 * 단, 생성한 랜덤한 수는 중복될 수 있음
		 */
		// 1부터 10사이의 랜덤한 수
		int min = 1;
		int max = 10;
		//int r = (int)(Math.random() * (max - min + 1) + min);
		//배열에 저장
		int arr[] = new int[6];
		int i, r;
		
		for(i=0 ; i < arr.length; i+=1) {
			r = (int)(Math.random() * (max - min + 1) + min);
			arr[i] = r;
		}
		//반복문(6번), 배열값 출력
		for(i=0 ; i < arr.length; i+=1) {
			System.out.print(arr[i] + " ");
		}		
	}
	}

