#include "ascii_converter.h"

namespace ascii_converter
{
    char to_ascii(int i)
    {
        if (i < 26)
            return i + 65;
        return -1;
    }

    int from_ascii(char c)
    {
        if (c >= 'A' && c <= 'Z')
            return c - 65;
        if (c >= 'a' && c <= 'z')
            return c - 97;
        return -1;
    }
}
