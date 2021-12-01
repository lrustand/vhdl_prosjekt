#include "rotor.cpp"
#include "glob.h"
#include <stdio.h>

void rotor_test()
{
    int i_wiring[LETTERS] = {
        0x15, // A -> V
        0x19, // B -> Z
        0x01, // C -> B
        0x11, // D -> R
        0x06, // E -> G
        0x08, // F -> I
        0x13, // G -> T
        0x18, // H -> Y
        0x14, // I -> U
        0x0f, // J -> P
        0x12, // K -> S
        0x03, // L -> D
        0x0d, // M -> N
        0x07, // N -> H
        0x0b, // O -> L
        0x17, // P -> X
        0x00, // Q -> A
        0x16, // R -> W
        0x0c, // S -> M
        0x09, // T -> J
        0x10, // U -> Q
        0x0e, // V -> O
        0x05, // W -> F
        0x04, // X -> E
        0x02, // Y -> C
        0x0a  // Z -> K
    };

    rotor rotor_i = rotor(i_wiring);

    bool success = true;
    for(int i = 0; i < LETTERS; i++)
    {
        for(char c = 'A'; c <= 'Z'; c++)
        {
            int enc = rotor_i.lookup(c-'A');
            int dec = 'A' + rotor_i.reverse_lookup(enc);
            if(dec != c)
            {
                printf("Failed symetry on %c with index %d: dec = %s!\n", c, rotor_i.index, dec);
                success = false;
            }
            if(i_wiring[(c - 'A' + rotor_i.index)%LETTERS] != (enc + rotor_i.index)%LETTERS)
            {
                printf("Failed lookup on %c with index %d: enc = %s!\n", c, rotor_i.index, enc);
                success = false;
            }
        }
        rotor_i.inc();
    }
    if(success)
    {
        printf("rotor passed all tests!\n");
    }
    else
    {
        printf("rotor has errors!\n");
    }
    int a;
    scanf("%d", a);
}
