package day4;

public class For8 {

	public static void main(String[] args) {
		/* a부터 z까지를 출력하는 코드를 작성하세요.
		 * i를 활용
		 * 반복횟수 : i는 0부터 26보다 작을 때까지(25보다 작거나 같다) i는 1씩 증가
		 * 규칙성  : (char)('a'+i)를 출력
		 * 반복 종료 후 : 없음
		 * */
		char ch = 'a'+ 0;
		int i;
		int k; //출력된 숫자 갯수
		
		for(i=0, k=0 ; i<26 ; i+=1 ) {
			System.out.print((char)('a'+i)+ " ");
			}
		
			System.out.println();
		/* a부터 z까지를 출력하는 코드를 작성하세요.
		 * ch를 활용
		 * 반복횟수 : ch는 'a'부터 'z'까지 ch는 1씩 증가
		 * 규칙성  : ch를 출력
		 * 반복 종료 후 : 없음
		 */
		for(ch ='a' ; ch <='z'; ch+=1 ) {
			System.out.print(ch + " ");
		}
		}
	}

