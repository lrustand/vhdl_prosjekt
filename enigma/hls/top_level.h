#include <iostream>
#include <vector>
#include "rotor.h"


class top_level
{
    private:
        rotor rotor_i;
        rotor rotor_j;
        rotor rotor_k;
        int message_length;

    public:
        top_level();
        char encode_received_letter(const int character);
        void increment_rotors();
        void reset();
        char encoded_message[200];
};
