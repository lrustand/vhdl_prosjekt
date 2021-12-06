library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotor_rom_I is
    port(addr1, addr2: in std_logic_vector(4 downto 0);
         data1, data2: out std_logic_vector(4 downto 0)
    );
end rotor_rom_I;

architecture arch of rotor_rom_I is
    type rom_type is array(0 to 25)
        of std_logic_vector(4 downto 0);
    -- ROM definition
    constant ROM1: rom_type:=(
        "00100", -- addr 00
        "01010", -- addr 01
        "01100", -- addr 02
        "00101", -- addr 03
        "01011", -- addr 04
        "00110", -- addr 05
        "00011", -- addr 06
        "10000", -- addr 07
        "10101", -- addr 08
        "11001", -- addr 09
        "01101", -- addr 10
        "10011", -- addr 11
        "01110", -- addr 12
        "10110", -- addr 13
        "11000", -- addr 14
        "00111", -- addr 15
        "10111", -- addr 16
        "10100", -- addr 17
        "10010", -- addr 18
        "01111", -- addr 19
        "00000", -- addr 20
        "01000", -- addr 21
        "00001", -- addr 22
        "10001", -- addr 23
        "00010", -- addr 24
        "01001"  -- addr 25
    );
    constant ROM2: rom_type:=(
        "10100", -- addr 00
        "10110", -- addr 01
        "11000", -- addr 02
        "00110", -- addr 03
        "00000", -- addr 04
        "00011", -- addr 05
        "00101", -- addr 06
        "01111", -- addr 07
        "10101", -- addr 08
        "11001", -- addr 09
        "00001", -- addr 10
        "00100", -- addr 11
        "00010", -- addr 12
        "01010", -- addr 13
        "01100", -- addr 14
        "10011", -- addr 15
        "00111", -- addr 16
        "10111", -- addr 17
        "10010", -- addr 18
        "01011", -- addr 19
        "10001", -- addr 20
        "01000", -- addr 21
        "01101", -- addr 22
        "10000", -- addr 23
        "01110", -- addr 24
        "01001"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end arch;
