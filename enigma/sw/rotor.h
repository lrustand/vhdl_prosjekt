#pragma once
#include "globals.h"
class Rotor
{
public:
    Rotor(int* arr);
    void inc();
    int lookup(int x);
    int reverse_lookup(int x);
    int index = 0;

private:
    int arr[LETTERS];
    int inv[LETTERS];
};
