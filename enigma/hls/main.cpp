#include "top_level.h"
#include "ascii_converter.h"


static top_level tl = top_level();

void enigma(const uint8_t input, uint8_t* output )
{
#pragma HLS INTERFACE mode=s_axilite port=enigma
#pragma HLS INTERFACE mode=s_axilite port=input
#pragma HLS INTERFACE mode=s_axilite port=output
    int character = ascii_converter::from_ascii(input);
    if (character == -1){
        *output = input;
    } else {
        *output = tl.encode_received_letter(character);
    }
    if (input == 0x0a || input == 0x0d){
        // Reset machine
        tl.reset();
    }
}
