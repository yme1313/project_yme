package day5;

import java.util.Scanner;

public class Array4 {

	public static void main(String[] args) {
		/* 1~10사이의 정수 3개를 랜덤으로 생성하여 배열에 저장한 후
		 * 생성된 값들이 중복되었는지 안되었는지 확인하는 코드를 작성하세요.
		 * 예시 : 
		 * 랜덤 : 3 8 2
		 * 중복되지 않음
		 * 예시 : 
		 * 랜덤 : 2 8 8
		 * 중복
		 * */
		/* 1~ 10사이의 정수를 랜덤하게 3개를 생성하는 코드
		 * 배열에 저장
		 * 생성된 값들이 중복되었는지 안 되었는지 확인하는 코드
		 * */
		int min = 1;
		int max = 10;
		//int r = (int)(Math.random() * (max - min + 1) + min);
		//배열에 저장
		int arr[] = new int[3];
		int i, k;
		/* 1 2 3 4 가 중북되는지 검사
		 * 12 13 14	i=1 k=i+1
		 * 23 24	i=2 
		 * 34 		i=3
		 * */
		
		Scanner scan = new Scanner(System.in);
		System.out.print("랜덤 : " );
		for(i=0 ; i < 3; i+=1) {
			arr[i] = (int)(Math.random() * (max - min + 1) + min);
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		boolean isDuplicated = false;
		for( i=0 ; i < arr.length-1 ; i+=1) {
			for(k=i+1 ; k < arr.length ; k+=1) {
				if(arr[i]==arr[k]) {
					isDuplicated = true;
				}
			}
		}
		if(isDuplicated) {
			System.out.println("중복");
		} else {
			System.out.println("중복 아님");
		}
		
		
		} 
	}


	
		

