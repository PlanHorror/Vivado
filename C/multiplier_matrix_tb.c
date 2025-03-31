#include "multiplier_matrix.c"
int main(){
  // Test the multiplier_matrix function
  int a[2][2] = {{1, 2}, {3, 4}};
  int b[2][2] = {{5, 6}, {7, 8}};
  int result[2][2];
  printf("Result of test case 1:\n");
  top(2, 2, 2, a, b, result);
  // Another test case
  int c[2][3] = {{1, 2, 3}, {4, 5, 6}};
  int d[3][2] = {{7, 8}, {9, 10}, {11, 12}};
  int result2[2][2];
  printf("Result of test case 2:\n");
  top(2, 3, 2, c, d, result2);
  // Another test case
  int e[4][9] = {
    {1, 2, 3, 4, 5, 6, 7, 8, 9},
    {10, 11, 12, 13, 14, 15, 16, 17, 18},
    {19, 20, 21, 22, 23, 24, 25, 26, 27},
    {28, 29, 30, 31, 32, 33, 34, 35, 36}
  };
  int f[9][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
    {10, 11, 12},
    {13, 14, 15},
    {16, 17, 18},
    {19, 20, 21},
    {22, 23, 24},
    {25, 26, 27}
  };
  int result3[4][3];
  printf("Result of test case 3:\n");
  top(4, 9, 3, e, f, result3);


}