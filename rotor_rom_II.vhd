library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotor_rom_II is
    port(addr1, addr2: in std_logic_vector(4 downto 0);
         data1, data2: out std_logic_vector(4 downto 0)    
    );
end rotor_rom_II;

architecture Behavioral of rotor_rom_II is
    type rom_type is array(0 to 31)
        of std_logic_vector(4 downto 0);
    -- ROM definition
    constant ROM1: rom_type:=(
        "00000", -- addr 00
        "01001", -- addr 01
        "00011", -- addr 02
        "01010", -- addr 03
        "10010", -- addr 04
        "01000", -- addr 05
        "10001", -- addr 06
        "10100", -- addr 07
        "10111", -- addr 08
        "00001", -- addr 09
        "01011", -- addr 10
        "00111", -- addr 11
        "10110", -- addr 12
        "10011", -- addr 13
        "01100", -- addr 14
        "00010", -- addr 15
        "10000", -- addr 16
        "00110", -- addr 17
        "11001", -- addr 18
        "01101", -- addr 19
        "01111", -- addr 20
        "11000", -- addr 21
        "00101", -- addr 22
        "10101", -- addr 23
        "01110", -- addr 24
        "00100"  -- addr 25
    );
    constant ROM2: rom_type:=(
        "00000", -- addr 00
        "01001", -- addr 01
        "01111", -- addr 02
        "00010", -- addr 03
        "11001", -- addr 04
        "10110", -- addr 05
        "10001", -- addr 06
        "01011", -- addr 07
        "00101", -- addr 08
        "00001", -- addr 09
        "00011", -- addr 10
        "01010", -- addr 11
        "01110", -- addr 12
        "10011", -- addr 13
        "11000", -- addr 14
        "10100", -- addr 15
        "10000", -- addr 16
        "00110", -- addr 17
        "00100", -- addr 18
        "01101", -- addr 19
        "00111", -- addr 20
        "10111", -- addr 21
        "01100", -- addr 22
        "01000", -- addr 23
        "10101", -- addr 24
        "10010"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end Behavioral;
