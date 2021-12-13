#include "globals.h"
#include "plugboard.h"
#include <stdio.h>

// Test that the path through the plugboard is the same both ways,
// e.g. if A => F, then F => A should also be true
bool test_plugboard_consistency()
{
    printf("\nTesting plugboard consistency:\n");
    bool success = true;
    for (int key=0; key<LETTERS; key++) {
        int value = plugboard[key];
        if (key != plugboard[value]) {
            printf("ERROR: %d => %d, but not %d => %d. ", key, value, value, key);
            printf("Actual %d => %d\n", value, plugboard[value]);
            success = false;
        }
    }
    if (success) printf("Pass\n");
    return success;
}

int main()
{
    printf("Testing plugboard\n");
    if (test_plugboard_consistency()) {
        printf("\nplugboard_tb passed all tests.\n\n");
    }
    else {
        printf("\nplugboard_tb failed 1 test(s).\n\n");
    }
}
