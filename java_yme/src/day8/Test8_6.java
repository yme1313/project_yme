package day8;

import java.util.Scanner;

public class Test8_6 {

	public static void main(String[] args) {
		/* 5개 짜리 배열에 같은 숫자가 2개 있는지 없는지 판별하는 코드를 작성하세요.
		 * 단, 숫자는 정렬되어 있다고 가정
		 * 입력 : 1 1 2 3 4
		 * 있음
		 * 입력 : 1 2 3 4 5
		 * 없음
		 * 입력 : 1 1 2 2 4
		 * 있음
		 * 입력 : 1 1 1 2 2
		 * count가 2와 같으면 res를 true로 수정
		 * */
		
		int arr[]= new int[] {1,2,3,4,5};
		int count=1;
		boolean res = false; // 숫자가 2개 일치하는 경우가 있는지 없는지 알려주는 변수

		for(int i=0 ; i < arr.length-1; i+=1) {
			if(arr[i]==arr[i+1]) {
				count+=1;
			} else {
				if(count==2) {
			}
				res=true;
				count=1;
			}			
			}
			if(count==2) {
				res=true;
			}
			if(res) {
				System.out.println("있음");
			} else {
				System.out.println("없음");
			}
}
}

