#include <stdio.h>
#include "reflector.h"

// Test that the path through the reflector is the same both ways,
// e.g. if A => Y, then Y => A should also be true
void test_reflector_consistency()
{
    for (const auto& [key, value] : reflector) {
        if (key != reflector[value]) {
            printf("ERROR: %c = %c, but %c != %c. ", key, value, value, key);
            printf("Actual %c = %c\n", value, reflector[value]);
        }
    }
}

// Helper function for verifying expected char mapping
void _verify(char key, char expected_value)
{
    char actual_value = reflector[key];
    if (actual_value != expected_value)
        printf("ERROR: %c != %c, but is instead %c\n", key, expected_value, actual_value);
}

// Tests a few random chars to see if they match the mapping of the real reflector
void test_reflector_correct_mapping()
{

    _verify('A', 'Y');
    _verify('R', 'B');
    _verify('V', 'W');
    _verify('C', 'U');
}


int main()
{
    test_reflector_consistency();
    test_reflector_correct_mapping();
}
