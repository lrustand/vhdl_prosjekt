#include "ascii_converter.h"
#include <stdio.h>

using namespace ascii_converter;

// Test int to ascii conversion
bool test_to_ascii(int i, char expected)
{
    bool success = true;
    char actual = to_ascii(i);
    if (actual != expected) {
        printf("ERROR: %d != %c. Actual %d = %c.\n", i, expected, i, actual);
        success = false;
    }
    return success;
}

// Test char to int conversion
bool test_from_ascii(char c, int expected)
{
    bool success = true;
    char actual = from_ascii(c);
    if (actual != expected) {
        printf("ERROR: %c != %d. Actual %c = %d.\n", c, expected, c, actual);
        success = false;
    }
    return success;
}

// Test double conversion
bool test_conversion_consistency()
{
    printf("\nTesting double conversion consistency:\n");
    bool success = true;
    for (int i=0; i<26; i++) {
        int converted = from_ascii(to_ascii(i));
        if (converted != i) {
            printf("ERROR: %d != %d. Actual %d => %d.\n", i, i, i, converted);
            success = false;
        }
    }

    for (char c='A'; c<='Z'; c++) {
        char converted = to_ascii(from_ascii(c));
        if (converted != c) {
            printf("ERROR: %c != %c. Actual %c => %c.\n", c, c, c, converted);
            success = false;
        }
    }
    if (success) printf("Pass\n");
    return success;
}


int main()
{
    int failed_testcases = 0;

    // Test a few random int to char conversions
    printf("\nTesting int to char conversion:\n");
    if (!test_to_ascii(0, 'A') ||
        !test_to_ascii(3, 'D') ||
        !test_to_ascii(25, 'Z'))
    {

        failed_testcases++;
    }
    else {
        printf("Pass\n");
    }


    // Test a few random char to int conversions
    if (!test_from_ascii('B', 1) ||
        !test_from_ascii('F', 5) ||
        !test_from_ascii('Y', 24))
    {

        failed_testcases++;
    }
    else {
        printf("Pass\n");
    }

    if (!test_conversion_consistency()) failed_testcases++;


    if (failed_testcases) {
        printf("converter_tb failed %d test(s).\n", failed_testcases);
    }
    else {
        printf("converter_tb passed all tests.\n");
    }
}
