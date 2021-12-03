#include <stdio.h>
#include "plugboard.h"

// Test that the path through the plugboard is the same both ways,
// e.g. if A => F, then F => A should also be true
bool test_plugboard_consistency()
{
    bool success = true;
    for (const auto& [key, value] : plugboard) {
        if (key != plugboard[value]) {
            printf("ERROR: %c = %c, but %c != %c. ", key, value, value, key);
            printf("Actual %c = %c\n", value, plugboard[value]);
            success = false;
        }
    }
    return success;
}

int main()
{
    if (test_plugboard_consistency()) {
        printf("plugboard_tb passed all tests.\n");
    }
    else {
        printf("plugboard_tb failed 1 test(s).\n");
    }
}
