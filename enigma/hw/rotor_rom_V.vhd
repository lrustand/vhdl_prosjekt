library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotor_rom_V is
    port(addr1, addr2: in std_logic_vector(4 downto 0);
         data1, data2: out std_logic_vector(4 downto 0)
    );
end rotor_rom_V;

architecture arch of rotor_rom_V is
    type rom_type is array(0 to 25)
        of std_logic_vector(4 downto 0);
    -- ROM definition
    constant ROM1: rom_type:=(
        "10101", -- addr 00
        "11001", -- addr 01
        "00001", -- addr 02
        "10001", -- addr 03
        "00110", -- addr 04
        "01000", -- addr 05
        "10011", -- addr 06
        "11000", -- addr 07
        "10100", -- addr 08
        "01111", -- addr 09
        "10010", -- addr 10
        "00011", -- addr 11
        "01101", -- addr 12
        "00111", -- addr 13
        "01011", -- addr 14
        "10111", -- addr 15
        "00000", -- addr 16
        "10110", -- addr 17
        "01100", -- addr 18
        "01001", -- addr 19
        "10000", -- addr 20
        "01110", -- addr 21
        "00101", -- addr 22
        "00100", -- addr 23
        "00010", -- addr 24
        "01010"  -- addr 25
    );
    constant ROM2: rom_type:=(
        "10000", -- addr 00
        "00010", -- addr 01
        "11000", -- addr 02
        "01011", -- addr 03
        "10111", -- addr 04
        "10110", -- addr 05
        "00100", -- addr 06
        "01101", -- addr 07
        "00101", -- addr 08
        "10011", -- addr 09
        "11001", -- addr 10
        "01110", -- addr 11
        "10010", -- addr 12
        "01100", -- addr 13
        "10101", -- addr 14
        "01001", -- addr 15
        "10100", -- addr 16
        "00011", -- addr 17
        "01010", -- addr 18
        "00110", -- addr 19
        "01000", -- addr 20
        "00000", -- addr 21
        "10001", -- addr 22
        "01111", -- addr 23
        "00111", -- addr 24
        "00001"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end arch;
