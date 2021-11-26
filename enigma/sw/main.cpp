#include "enigma.h"
#include "ascii_converter.h"
#include <vector>


int main(int argc, char const *argv[])
{
    enigma machine = enigma();

    while (1)
    {
        while (1)
        {
            char c = getchar();
            int character = ascii_converter::from_ascii(c);
            if (character == -1){
                machine.add_to_encoded_message(c);
            } else {
                machine.encode_received_letter(character);
            }
            if (c == 0x0a || c == 0x0d){
                break;
            }
        }

        machine.send_encode_message();

        // Reset machine
        machine.reset();
    }
}
