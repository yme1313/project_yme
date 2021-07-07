import java.util.Scanner;

class Main {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		int [] arr = new int[9];
		int max = 0;
		int i;
		int count= 0;
		
		for(i=0 ; i < arr.length ; i++) {
			arr[i]= scan.nextInt();
			
			if(max < arr[i]) {
				max = arr[i];
				count = i+1;
			}
		}
		System.out.println(max);
		System.out.println(count);
		scan.close();
	}
}
