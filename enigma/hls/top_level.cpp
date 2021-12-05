#include <iostream>
#include <stdio.h>
#include "top_level.h"
#include "plugboard.h"
#include "ascii_converter.h"
#include "reflector.h"


top_level::top_level()
{
    rotor_i = rotor(0);
    rotor_j = rotor(2);
    rotor_k = rotor(3);
    message_length = 0;
}

char top_level::encode_received_letter(const int character)
{
    int from_plugboard = plugboard[character];
    int rotor_output_i = rotor_i.lookup(from_plugboard);
    int rotor_output_j = rotor_j.lookup(rotor_output_i);
    int rotor_output_k = rotor_k.lookup(rotor_output_j);
    int from_reflector = reflector[rotor_output_k];
    int loopback_output_k = rotor_k.reverse_lookup(from_reflector);
    int loopback_output_j = rotor_j.reverse_lookup(loopback_output_k);
    int loopback_output_i = rotor_i.reverse_lookup(loopback_output_j);

    top_level::increment_rotors();
    int back_from_plugboard = plugboard[loopback_output_i];
    return ascii_converter::to_ascii(back_from_plugboard);

}

void top_level::increment_rotors()
{
    rotor_i.inc();
    if(rotor_i.index == 0){
        rotor_j.inc();
        if(rotor_j.index == 0){
            rotor_k.inc();
        }
    }
}

void top_level::reset()
{
    rotor_i.index = 0;
    rotor_j.index = 0;
    rotor_k.index = 0;
}
