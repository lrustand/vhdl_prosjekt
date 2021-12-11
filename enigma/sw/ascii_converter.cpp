#include "ascii_converter.h"
#include "globals.h"

namespace ascii_converter
{
    char to_ascii(int i)
    {
        if (i < LETTERS)
            return i + 'A';
        return -1;
    }

    int from_ascii(char c)
    {
        if (c >= 'A' && c <= 'Z')
            return c - 'A';
        if (c >= 'a' && c <= 'z')
            return c - 'a';
        return -1;
    }
}
