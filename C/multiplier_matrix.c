#include <stdio.h>
#include <stdlib.h>

// Function to multiply two matrices
void matrix_multiply(int m, int n, int p, int A[m][n], int B[n][p], int C[m][p]) {
    // Initialize result matrix C to 0
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < p; j++) {
            C[i][j] = 0;
        }
    }

    // Matrix multiplication
    for (int i = 0; i < m; i++) {       
        for (int j = 0; j < p; j++) {   
            for (int k = 0; k < n; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

// Print a matrix (for debugging/testing)
void print_matrix(int rows, int cols, int matrix[rows][cols]) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

void top(int m, int n, int p, int A[m][n], int B[n][p], int C[m][p]) {
    matrix_multiply(m, n, p, A, B, C);

    // Print results
    printf("Matrix A (%dx%d):\n", m, n);
    print_matrix(m, n, A);

    printf("\nMatrix B (%dx%d):\n", n, p);
    print_matrix(n, p, B);

    printf("\nResult Matrix C (%dx%d):\n", m, p);
    print_matrix(m, p, C);
}