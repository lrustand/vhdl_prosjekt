#include <iostream>
#include <vector>
#include "rotor.h"


class enigma
{
    private:
        std::vector<char> encoded_message;
        rotor rotor_i;
        rotor rotor_j;
        rotor rotor_k;

    public:
        enigma();
        void add_to_encoded_message(const char character);
        void encode_received_letter(const int character);
        void send_encode_message();
        void increment_rotors();
        void reset();
};
