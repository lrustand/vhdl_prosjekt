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
    if (index >= LETTERS-1)
        index = 0;
    else
        index++;
}

int rotor::lookup(int x)
{
    int rotated_address = index + x;
    if (rotated_address >= LETTERS)
        rotated_address -= LETTERS;
    
    int character = arr[rotated_address] - index;
    if (character < 0)
        character += LETTERS;
    
    return character;
}

int rotor::reverse_lookup(int x)
{
    int rotated_address = index + x;
    if (rotated_address >= LETTERS)
        rotated_address -= LETTERS;
    
    int character = inv[rotated_address] - index;
    if (character < 0)
        character += LETTERS;
    
    return character;
}
