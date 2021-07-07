package day8;

public class Test8_7 {

	public static void main(String[] args) {
		/* 5개 짜리 배열에 페어가 몇개 있는지 판별하는 코드를 작성하세요.
		 * 단, 숫자는 정렬되어 있다고 가정
		 * 입력 : 1 1 2 3 4
		 * 1
		 * 입력 : 1 2 3 4 5
		 * 0
		 * 입력 : 1 1 2 2 4
		 * 2
		 * true의 갯수를 출력
		 * */
		
		int arr[]= new int[] {1,1,2,2,3};
		int count=1;
		int res = 0; // 중복되는게 몇개인지 ...
		
		for(int i=0 ; i < arr.length-1; i+=1) {
			if(arr[i]==arr[i+1]) {
				count += 1;
			}else {
				if(count == 2) {
				res += 1;
			}
				count =1;
			}	
			}
			if(count==2) {
				res += 1;
			} 
			System.out.println(res);
}
}

