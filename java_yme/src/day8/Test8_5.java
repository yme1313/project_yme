package day8;

import java.util.Scanner;

public class Test8_5 {

	public static void main(String[] args) {
		/* 10개짜리 배열에 1부터 10를 저장한 후 출력하는 코드를 작성하세요
		 * */
		int arr[] = new int[10];
		int i;
		for(i=0 ; i < arr.length ; i+=1) {
			arr[i] = i+1;
			System.out.print(arr[i] + " ");
		}
		System.out.println("\n---------------------");
		/* 10개짜리 배열에 피보나치수열을 저장한 후 출력하는 코드를 작성하세요.
		 * 피보나치수열
		 * - 앞에 두개를 더하여 나열함
		 * - 0번지 :1, 1번지 : 1
		 * - 1 1 2 3 5 8 13 21 34 55
		 * */
		
		int arr2[]= new int[10];
		arr2[0] = arr2[1]= 1;

		for(i=2 ; i < arr2.length ; i+=1) {
			arr2[i]= arr2[i-2] + arr2[i-1];
		}for(i=0 ; i<arr2.length; i+=1) {
			System.out.print( arr2[i]+ " ");
		} 
		System.out.println("\n---------------------");
		/* 5개짜리 배열에 저장된 숫자들 중 연속된 3자리 숫자가 있는지 확인하는 코드를 작성하세요.
		 * 단, 숫자들은 정렬되었다고 가정
		 * 예시
		 * 입력 : 1 1 2 3 4
		 * 연속
		 * 입력 : 1 2 4 5 8
		 * 연속아님
		 * */
		
		int arr3[]= new int[] {1,2,3,4,6};
		int count=1;

		System.out.print("입력 : " );
		for(i=0 ; i < arr3.length-1; i+=1) {
			//i번지의 값과 i+1번지의 값의 차이가 1이면 count를 1 증가
			if(arr3[i] +1 ==  arr3[i+1]) {
				count+=1;
			} else {
				count=1;
			}
			if(count==3) {
				break;
			}
		} if(count==3) {
			System.out.print("연속");
		} else {
			System.out.println("연속 아님");
		}
		System.out.println();
	
			
		
		
		
	}
}