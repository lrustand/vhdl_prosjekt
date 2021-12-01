#include "rotor.cpp"
#include <stdio.h>

void rotor_test()
{
	int i_wiring[] = {
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

	rotor i = rotor(i_wiring);

	bool success = true;

	for(char c = 'A'; c <= 'Z'; c++)
	{
		int enc = i.lookup(c-'A');
		int dec = 'A' + i.lookup(enc-'A');
		if(dec != c)
		{
			printf("Failed on %c with index %d: dec = %s!", c, i.index, dec);
		}
	}
	int a;
	scanf("%d", a);
}
