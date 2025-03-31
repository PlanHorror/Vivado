#include "multiplier_matrix.c"  // Include the header file with the declaration of 'top'

int main() {
    // Test case 1: 2x2 * 2x2 (Simple integers as floats)
    float a[2][2] = {{1.0f, 2.0f}, {3.0f, 4.0f}};
    float b[2][2] = {{5.0f, 6.0f}, {7.0f, 8.0f}};
    float result[2][2];
    printf("Result of test case 1 (2x2 * 2x2):\n");
    top(2, 2, 2, a, b, result);

    // Test case 2: 2x3 * 3x2 (Integers as floats)
    float c[2][3] = {{1.0f, 2.0f, 3.0f}, {4.0f, 5.0f, 6.0f}};
    float d[3][2] = {{7.0f, 8.0f}, {9.0f, 10.0f}, {11.0f, 12.0f}};
    float result2[2][2];
    printf("\nResult of test case 2 (2x3 * 3x2):\n");
    top(2, 3, 2, c, d, result2);

    // Test case 3: 4x9 * 9x3 (Larger integers as floats)
    float e[4][9] = {
        {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f},
        {10.0f, 11.0f, 12.0f, 13.0f, 14.0f, 15.0f, 16.0f, 17.0f, 18.0f},
        {19.0f, 20.0f, 21.0f, 22.0f, 23.0f, 24.0f, 25.0f, 26.0f, 27.0f},
        {28.0f, 29.0f, 30.0f, 31.0f, 32.0f, 33.0f, 34.0f, 35.0f, 36.0f}
    };
    float f[9][3] = {
        {1.0f, 2.0f, 3.0f},
        {4.0f, 5.0f, 6.0f},
        {7.0f, 8.0f, 9.0f},
        {10.0f, 11.0f, 12.0f},
        {13.0f, 14.0f, 15.0f},
        {16.0f, 17.0f, 18.0f},
        {19.0f, 20.0f, 21.0f},
        {22.0f, 23.0f, 24.0f},
        {25.0f, 26.0f, 27.0f}
    };
    float result3[4][3];
    printf("\nResult of test case 3 (4x9 * 9x3):\n");
    top(4, 9, 3, e, f, result3);

    // Test case 4: 1x2 * 2x1 (Small matrix with decimals)
    float g[1][2] = {{1.5f, 2.7f}};
    float h[2][1] = {{3.2f}, {4.8f}};
    float result4[1][1];
    printf("\nResult of test case 4 (1x2 * 2x1):\n");
    top(1, 2, 1, g, h, result4);

    // Test case 5: 3x3 * 3x3 (Square matrix with mixed floats)
    float i[3][3] = {
        {0.5f, 1.2f, 2.3f},
        {3.4f, 4.5f, 5.6f},
        {6.7f, 7.8f, 8.9f}
    };
    float j[3][3] = {
        {1.1f, 2.2f, 3.3f},
        {4.4f, 5.5f, 6.6f},
        {7.7f, 8.8f, 9.9f}
    };
    float result5[3][3];
    printf("\nResult of test case 5 (3x3 * 3x3):\n");
    top(3, 3, 3, i, j, result5);

    // Test case 6: 2x4 * 4x2 (Decimals and negatives)
    float k[2][4] = {
        {1.1f, -2.2f, 3.3f, 4.4f},
        {-5.5f, 6.6f, -7.7f, 8.8f}
    };
    float l[4][2] = {
        {0.5f, 1.5f},
        {2.5f, -3.5f},
        {4.5f, 5.5f},
        {-6.5f, 7.5f}
    };
    float result6[2][2];
    printf("\nResult of test case 6 (2x4 * 4x2):\n");
    top(2, 4, 2, k, l, result6);

    return 0;
}