#include <stdio.h>
#include "rotor.h"

Rotor::Rotor(int* arr)
{
    for(int i = 0; i < LETTERS; i++)
    {
                    this->arr[i] = arr[i];
        inv[arr[i]] = i;
    }
}

void Rotor::inc()
{
    index++;
    index %= LETTERS;
}

int Rotor::lookup(int x)
{
    return (arr[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
}

int Rotor::reverse_lookup(int x)
{
    return (inv[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
}
