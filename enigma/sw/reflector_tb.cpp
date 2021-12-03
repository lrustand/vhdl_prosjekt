#include <stdio.h>
#include "reflector.h"

// Test that the path through the reflector is the same both ways,
// e.g. if A => Y, then Y => A should also be true
bool test_reflector_consistency()
{
    printf("\nTesting reflector consistency:\n");
    bool success = true;
    for (const auto& [key, value] : reflector) {
        if (key != reflector[value]) {
            printf("ERROR: %d => %d, but not %d => %d. ", key, value, value, key);
            printf("Actual %d => %d\n", value, reflector[value]);
            success = false;
        }
    }
    if (success) printf("Pass\n");
    return success;
}

// Helper function for verifying expected char mapping
bool _verify(int key, int expected_value)
{
    bool success = true;
    char actual_value = reflector[key];
    if (actual_value != expected_value) {
        printf("ERROR: %d does not map to %d, but is instead %d\n", key, expected_value, actual_value);
        success = false;
    }
    return success;
}

// Tests a few random chars to see if they match the mapping of the real reflector
bool test_reflector_correct_mapping()
{
    printf("\nTesting correctness of reflector mapping:\n");

    bool success =
        _verify(INT('A'), INT('Y')) &&
        _verify(INT('R'), INT('B')) &&
        _verify(INT('V'), INT('W')) &&
        _verify(INT('C'), INT('U'));
    if (success) printf("Pass\n");
    return success;
}


int main()
{
    printf("Testing reflector\n");

    int failed_testcases = 0;

    failed_testcases += !test_reflector_consistency();
    failed_testcases += !test_reflector_correct_mapping();

    if (failed_testcases) {
        printf("\nreflector_tb failed %d test(s).\n\n", failed_testcases);
    }
    else {
        printf("\nreflector_tb passed all tests.\n\n");
    }
}
