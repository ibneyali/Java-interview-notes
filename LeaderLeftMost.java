public class LeaderLeftMost {

	// Input: arr[] = {16, 17, 4, 3, 5, 2},
	//	Output: 16, 17
	//	Input: arr[] = {1, 2, 4, 8, 2, 20, 5}, 
	//	Output: 1, 2, 4, 8, 20

	public static void main(String[] args) {

		int arr[] = { 16, 17, 4, 3, 5, 2 };
		int n = arr.length;
		int max = arr[0];

		System.out.println(max);

		for (int i = 0; i < n; i++) {
			if (arr[i] > max) {
				max = arr[i];
				System.out.println(max);
			}
		}
	}

}

