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
    int rotate(int x);
    int rotate_back(int x);
    int arr[LETTERS];
    int inv[LETTERS];
};
