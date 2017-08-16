public class MaxSum {

	public int maxSum(int[][] matrix) {
		int start = matrix.length + matrix[i].length - 2;
		int i, j;
		for (int counter = start; counter >= 0; counter--) {
			for (i = 0; i <= counter; i++) {
				j = counter - i;
				if (i < matrix.length && j < matrix[i].length) {
					j = counter - i;
					if (i + 1 <  matrix.length && j + 1 <  matrix[i].length) {
						matrix[i][j] += matrix[i+1][j] < matrix[i][j+1] ? matrix[i][j+1] : matrix[i+1][j];
					} else if (i + 1 <  matrix.length && j + 1 >= matrix[i].length) {
						matrix[i][j] += matrix[i+1][j];
					} else if (i + 1 >= matrix.length && j + 1 <  matrix[i].length) {
						matrix[i][j] += matrix[i][j+1];
					}
					
					/*
						4 casos:
							1: i + 1 >= matrix.length && j + 1 >= matrix[i].length;
							2: i + 1 >= matrix.length && j + 1 <  matrix[i].length;
							3: i + 1 <  matrix.length && j + 1 >= matrix[i].length;
							4: i + 1 <  matrix.length && j + 1 <  matrix[i].length;
					*/
				}
			}
		
		}
		
		/*
			start = 3 + 3 - 2 <-> 4;
			counter = 4; 4 >= 0 <-> true;
				i = 0; 0 < 4 <-> true;
					j = 4 - 0 <-> 4;
					4 < 3 & 0 < 3 <-> false;
				i++ <-> 1; 1 < 4 <-> true;
					j = 4 - 1 <-> 3;
					1 < 3 && 3 < 3<-> false;
				i++ <-> 2; 2 < 4 <-> true;
					j = 4 - 2 <-> 2;
					2 < 3 && 2 < 3 <-> true && true <-> true;
						3 < 3 && 3 < 3 <-> false;
						3 < 3 && 3 >= 3 <-> false;
						3 >= 3 && 3 < 3 <-> true && false <-> false;
				i++ <-> 3; 3 < 4 <-> true
					j = 4 - 3 <-> 1;
					1 < 3 && 3 < 3 <-> false;
				i++ <-> 4; 4 <= 4 <-> true;
					j = 4 - 4 <-> 0;
					0 < 3 && 4 < 3 <-> true && false <-> false;
			counter-- <-> 3; 3 >= 0 <-> true;
				i = 0; 0 < 3 <-> true;
					j = 3 - 0 <-> 3;
					0 < 3 && 3 < 3 <-> false;
				i++ <-> 1; 1 < 3 <-> true;
					j = 3 - 1 <-> 2;
					1 < 3 && 2 < 3 <-> true && true <-> true;
						2 < 3 && 3 < 3 <-> true && false <-> false;
						2 < 3 && 3 >= 3 <-> true && true <-> true;
							matrix[1][2] = 6 + matrix[2][2] <-> 6 + 9 <-> 15
				i++ <-> 2; 2 < 3 <-> true;
					j = 3 - 2 <-> 1;
					2 < 3 && 1 < 3 <-> true && true <-> true;
						3 < 3 && 2 < 3 <-> false;
						3 < 3 && 2 >= 3 <-> false;
						3 >= 3 && 2 < 3 <-> true && true <-> true;
							matrix[2][1] = 8 + matrix[2][2] <-> 8 + 9 <-> 17
				i++ <-> 3; 3 < 3 <-> false;
			counter-- <-> 2; 2 >= 0 <-> true;
				i = 0; 0 < 2 <-> true;
					j = 2 - 0 <-> 2;
					0 < 3 && 2 < 3 <-> true && true <-> true;
						1 < 3 && 3 < 3 <-> true && false <-> false;
						1 < 3 && 3 >= 3 <-> true && true <-> true;
							matrix[0][2] = 3 + matrix[1][2] <-> 3 + 15 <-> 18
				i++ <-> 1; 1 < 2 <-> true;
					j = 2 - 1 <-> 1;
					1 < 3 && 1 < 3 <-> true && true <-> true;
						2 < 3 && 2 < 3 <-> true && true <-> true;
							matrix[1][1] = 5 + (matrix[2][1] < matric[1][2] <-> 17 < 15 <-> false ? matrix[2][1] : matrix[1][2]) <-> 5 + 17 <-> 22
					
				i++ <-> 2; 2 < 2 <-> false
			counter--
					
			
		*/
	

	}
/*
	1	2	3		0,0	0,1	0,2		i,j
	4	5	6		1,0	1,1	1,2
	7	8	9		2,0	2,1	2,2

			18
		22	15
		17	9
*/
}

