#include <stdio.h>
#include "glob.h"

class rotor
{
    int arr[LETTERS];
    int inv[LETTERS];

public:
    int index = 0;

    rotor(int* arr)
    {
        for(int i = 0; i < LETTERS; i++)
        {
                        this->arr[i] = arr[i];
            inv[arr[i]] = i;
        }
    }

    void inc()
    {
        index++;
        index %= LETTERS;
    }

    int lookup(int x)
    {
        return (arr[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
    }

    int reverse_lookup(int x)
    {
        return (inv[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
    }
};
