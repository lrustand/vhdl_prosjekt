#include "ascii_converter.h"
#include <stdio.h>

using namespace ascii_converter;

void test_to_ascii(int i, char expected)
{
    char actual = to_ascii(i);
    if (actual != expected) {
        printf("ERROR: %d != %c. Actual %d = %c.\n", i, expected, i, actual);
    }
}

void test_from_ascii(char c, int expected)
{
    char actual = from_ascii(c);
    if (actual != expected) {
        printf("ERROR: %c != %d. Actual %c = %d.\n", c, expected, c, actual);
    }
}

int main()
{
    test_to_ascii(0, 'A');
    test_to_ascii(3, 'D');
    test_to_ascii(25, 'Z');

    test_from_ascii('B', 1);
    test_from_ascii('F', 5);
    test_from_ascii('Y', 24);
}
