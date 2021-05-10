package day10;

public class Sort {

	public static void main(String[] args) {
		/* 배열 정렬 : 버블 정렬, 효율이 좋지 않으나 이해하기 쉬움
		 * - 옆에 요소와 비교하여 정렬하는 방법, 가장 큰 수로 정렬하고 확정
		 * 5 4 6 9 8 7 10 /0번지 1번지 비교하여 1번지 숫자가 작음으로 교체
		 * 4 5 6 9 8 7 10 /1번지 2번지 비교하여 2번지 숫자가 큼으로 교체 안함
		 * 4 5 6 8 9 7 10 /3번지 4번지 비교
		 * 4 5 6 8 7 9 10 /4번지 5번지 비교
		 * 4 5 6 8 7 9 10 => 10 확정
		 * 4 5 6 7 8 9 10 /4번지 5번지 비교하여 5번지 숫자가 작음으로 교체
		 * 4 5 6 7 8 9 10 => 9 확정
		 * .... 위 작업을 8확정,7확정,6확정,5확정 될때까지 반복 마지막은 자동으로 확정 n-1개까지 확정
		 * 작은 반복문의 횟수 
		 * 	- 0=>1=>2=>3=>4=>5 i의 값
		 *  - 6=>5=>4=>3=>2=>1 비교 반복횟수 감소
		 *  => 6-i < arr.length -i
		 */
		  
		int arr[]= new int[] {5,4,6,9,8,7,10};
		printArray(arr);
		System.out.println();
		for(int i=0 ; i <arr.length-1 ; i+=1) {
			for(int k=0 ; k < arr.length-1-i ; k+=1) {
				if(arr[k]>arr[k+1]) {
					int tmp =arr[k];
					arr[k] = arr[k+1];
					arr[k+1] = tmp;
				}
				printArray(arr);
				System.out.println();
			}
		}
		printArray(arr);
	}
	public static void printArray(int []arr) {
		for(int i=0 ; i <arr.length ; i+=1) {
			System.out.print(arr[i] + " ");
		}
	}
	
	
}
