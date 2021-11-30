#include <stdio.h>
#include "plugboard.h"

// Test that the path through the plugboard is the same both ways,
// e.g. if A => F, then F => A should also be true
void test_plugboard_consistency()
{
    for (const auto& [key, value] : plugboard) {
        if (key != plugboard[value]) {
            printf("ERROR: %c = %c, but %c != %c. ", key, value, value, key);
            printf("Actual %c = %c\n", value, plugboard[value]);
        }
    }
}

int main()
{
    test_plugboard_consistency();
}
