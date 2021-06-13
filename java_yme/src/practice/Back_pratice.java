package practice;

import java.util.Scanner;

public class Back_pratice {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
			int a = scan.nextInt();
			int b = scan.nextInt();
			int c = scan.nextInt();	
			int res = a*b*c;
			String str = String.valueOf(res);
			int arr[] = new int[10];
			for(int i=0 ; i<arr.length ; i++) {
				arr[str.charAt(i)-48]++;
			}
			for(int i=0 ; i<=9; i++) {
				System.out.println(arr[i]);
			}
	
			
		scan.close();
	}
}	





