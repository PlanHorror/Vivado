#include <stdio.h>
#include <stdlib.h>

// Function to multiply two matrices (float version)
void matrix_multiply(int m, int n, int p, float A[m][n], float B[n][p], float C[m][p]) {
    // Initialize result matrix C to 0.0
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < p; j++) {
            C[i][j] = 0.0f;  // Use 0.0f for float
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

// Print a matrix (for debugging/testing, float version)
void print_matrix(int rows, int cols, float matrix[rows][cols]) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%.2f ", matrix[i][j]);  // %.2f for 2 decimal places
        }
        printf("\n");
    }
}

// Top-level function to perform multiplication and print results
void top(int m, int n, int p, float A[m][n], float B[n][p], float C[m][p]) {
    matrix_multiply(m, n, p, A, B, C);

    // Print results
    printf("Matrix A (%dx%d):\n", m, n);
    print_matrix(m, n, A);

    printf("\nMatrix B (%dx%d):\n", n, p);
    print_matrix(n, p, B);

    printf("\nResult Matrix C (%dx%d):\n", m, p);
    print_matrix(m, p, C);
}
