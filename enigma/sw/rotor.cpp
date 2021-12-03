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

int Rotor::rotate(int x)
{
    x += index;
    x %= LETTERS;
    return x;
}

int Rotor::rotate_back(int x)
{
    x += LETTERS;
    x -= index;
    x %= LETTERS;
    return x;
}

int Rotor::lookup(int x)
{
    return rotate_back(arr[rotate(x)]);
}

int Rotor::reverse_lookup(int x)
{
    return rotate_back(inv[rotate(x)]);
}
