#include <stdio.h>
#include "reflector.h"

// Test that the path through the reflector is the same both ways,
// e.g. if A => Y, then Y => A should also be true
bool test_reflector_consistency()
{
    bool success = true;
    for (const auto& [key, value] : reflector) {
        if (key != reflector[value]) {
            printf("ERROR: %c = %c, but %c != %c. ", key, value, value, key);
            printf("Actual %c = %c\n", value, reflector[value]);
            success = false;
        }
    }
    return success;
}

// Helper function for verifying expected char mapping
bool _verify(char key, char expected_value)
{
    bool success = true;
    char actual_value = reflector[key];
    if (actual_value != expected_value) {
        printf("ERROR: %c != %c, but is instead %c\n", key, expected_value, actual_value);
        success = false;
    }
    return success;
}

// Tests a few random chars to see if they match the mapping of the real reflector
bool test_reflector_correct_mapping()
{
    return
        _verify('A', 'Y') &&
        _verify('R', 'B') &&
        _verify('V', 'W') &&
        _verify('C', 'U');
}


int main()
{
    int failed_testcases = 0;

    failed_testcases += !test_reflector_consistency();
    failed_testcases += !test_reflector_correct_mapping();

    if (failed_testcases) {
        printf("reflector_tb failed %d test(s).\n");
    }
    else {
        printf("reflector_tb passed all tests.\n");
    }
}
