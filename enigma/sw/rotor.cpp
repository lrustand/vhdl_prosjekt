#include "globals.h"
#include "rotor.h"

rotor::rotor(){}

rotor::rotor(int* arr)
{
    for(int i = 0; i < LETTERS; i++)
    {
        this->arr[i] = arr[i];
        inv[arr[i]] = i;
    }
}

rotor::rotor(int rotor_number)
{
    if ((rotor_number > 5) || (rotor_number < 0)){
        rotor_number = 0;
    }

    for(int i = 0; i < LETTERS; i++)
    {
        this->arr[i] = rotors[rotor_number][i];
        inv[arr[i]] = i;
    }
}

void rotor::inc()
{
    index++;
    index %= LETTERS;
}

int rotor::lookup(int x)
{
    return (arr[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
}

int rotor::reverse_lookup(int x)
{
    return (inv[(x + index)%LETTERS] + LETTERS - index)%LETTERS;
}
