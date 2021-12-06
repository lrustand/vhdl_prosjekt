library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotor_rom_III is
    port(addr1, addr2: in std_logic_vector(4 downto 0);
         data1, data2: out std_logic_vector(4 downto 0)    
    );
end rotor_rom_III;

architecture arch of rotor_rom_III is
    type rom_type is array(0 to 25)
        of std_logic_vector(4 downto 0);
    -- ROM definition
    constant ROM1: rom_type:=(
        "00001", -- addr 00
        "00011", -- addr 01
        "00101", -- addr 02
        "00111", -- addr 03
        "01001", -- addr 04
        "01011", -- addr 05
        "00010", -- addr 06
        "01111", -- addr 07
        "10001", -- addr 08
        "10011", -- addr 09
        "10111", -- addr 10
        "10101", -- addr 11
        "11001", -- addr 12
        "01101", -- addr 13
        "11000", -- addr 14
        "00100", -- addr 15
        "01000", -- addr 16
        "10110", -- addr 17
        "00110", -- addr 18
        "00000", -- addr 19
        "01010", -- addr 20
        "01100", -- addr 21
        "10100", -- addr 22
        "10010", -- addr 23
        "10000", -- addr 24
        "01110"  -- addr 25
    );
    constant ROM2: rom_type:=(
        "10011", -- addr 00
        "00000", -- addr 01
        "00110", -- addr 02
        "00001", -- addr 03
        "01111", -- addr 04
        "00010", -- addr 05
        "10010", -- addr 06
        "00011", -- addr 07
        "10000", -- addr 08
        "00100", -- addr 09
        "10100", -- addr 10
        "00101", -- addr 11
        "10101", -- addr 12
        "01101", -- addr 13
        "11001", -- addr 14
        "00111", -- addr 15
        "11000", -- addr 16
        "01000", -- addr 17
        "10111", -- addr 18
        "01001", -- addr 19
        "10110", -- addr 20
        "01011", -- addr 21
        "10001", -- addr 22
        "01010", -- addr 23
        "01110", -- addr 24
        "01100"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end arch;
