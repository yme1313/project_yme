package day8;

import java.util.Scanner;

public class Test8_1 {

	public static void main(String[] args) {
		/* 1~9사이의 정수를 입력받아 각 숫자가 몇번 입력 됐는지 출력하는 코드를 작성하세요.
		 * 1~가 아닌 다른 숫자가 입력되면 입력 종료하고 각 숫자가 몇 번 입력 됐는지 출력
		 * 예시
		 * 입력 : 1
		 * 입력 : 1
		 * 입력 : 9
		 * 입력 : 3
		 * 입력 : 2
		 * 입력 : -1
		 * 1 : 2번
		 * 2 : 1번
		 * 3 : 1번
		 * 4 : 0번
		 * 5 : 0번
		 * 6 : 0번
		 * 7 : 0번
		 * 8 : 0번
		 * 9 : 1번
		 * */
 		 
		/* 반복횟수 : 정해져 있지 않음
		 * 규칙성  : 1~9사이의 정수를 입력 받고 각 숫자가 몇번 입력 되었는지 저장
		 * 반복 종료 후 : -1이 입력되면 종료하고 각 숫자가 몇번 입력 되었는지 출력
		 * */
		/* 입력된 숫자를 배열에 각 번지에 저장
		 * */
		
		
		int arr[]=new int[10];	
		int num;
		Scanner scan = new Scanner(System.in);
		while(true) {
			System.out.print("입력(1~9) : ");
			num = scan.nextInt();
			if(num<1 || num>9) {
				break;
			}
			arr[num]+=1;
		} 
		for (int i=1 ; i< arr.length ;i+=1 ) {
			System.out.println(i + " : " + arr[i] + "번");
		}
		scan.close();
		}
	}

