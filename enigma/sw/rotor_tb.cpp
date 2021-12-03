#include "rotor.h"
#include "glob.h"
#include <stdio.h>

bool symmetry_test(Rotor rotor)
{
    bool success = true;

    for(int i = 0; i < LETTERS; i++)
    {
        for(char c = 'A'; c <= 'Z'; c++)
        {
            int enc = rotor.lookup(c-'A');
            int dec = 'A' + rotor.reverse_lookup(enc);

            if(dec != c)
            {
                printf("ERROR: Failed symmetry on %c with rotor index ", c);
                printf("%d: dec = %c. Should be dec = %c.\n", rotor.index, dec, c);
                success = false;
            }
        }

        rotor.inc();
    }

    if(success) printf("Pass\n");
    return success;
}

bool lookup_test(Rotor rotor, int wiring[])
{
    bool success = true;

    for(int i = 0; i < LETTERS; i++)
    {
        for(char c = 'A'; c <= 'Z'; c++)
        {
            int enc = rotor.lookup(c-'A');

            if(wiring[(c - 'A' + rotor.index)%LETTERS] != (enc + rotor.index)%LETTERS)
            {
                int lookup = wiring[(c - 'A' + rotor.index)%LETTERS];
                int expected = (lookup + LETTERS - rotor.index)%LETTERS;
                printf("ERROR: Failed lookup on %c with rotor index ", c);
                printf("%d: enc = %d. Should be enc = %d.\n", rotor.index, enc, expected);
                success = false;
            }
        }

        rotor.inc();
    }

    if(success) printf("Pass\n");
    return success;
}

int main()
{
    int wiring[LETTERS] = {
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

    Rotor rotor = Rotor(wiring);

    int failures = 0;
    printf("Testing rotor\n");
    printf("\nTesting rotor symmetry\n");
    failures += !symmetry_test(rotor);
    printf("\nTesting rotor lookup\n");
    failures += !lookup_test(rotor, wiring);

    if(failures == 0)
    {
        printf("\nRotor passed all tests.\n\n");
        return 0;
    }
    else
    {
        printf("\nRotor failed %d test(s).\n\n", failures);
        return 1;
    }
}
