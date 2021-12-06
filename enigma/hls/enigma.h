#include <iostream>
#include <vector>
#include "rotor.h"


class enigma
{
    private:
        rotor rotor_i;
        rotor rotor_j;
        rotor rotor_k;
        int message_length;

    public:
        enigma();
        char encode_received_letter(const int character);
        void increment_rotors();
        void reset();
        char encoded_message[200];
};
