library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotor_rom_IV is
    port(addr1, addr2: in std_logic_vector(4 downto 0);
         data1, data2: out std_logic_vector(4 downto 0)    
    );
end rotor_rom_IV;

architecture Behavioral of rotor_rom_IV is
    type rom_type is array(0 to 31)
        of std_logic_vector(4 downto 0);
    -- ROM definition
    constant ROM1: rom_type:=(
        "00100", -- addr 00
        "10010", -- addr 01
        "01110", -- addr 02
        "10101", -- addr 03
        "01111", -- addr 04
        "11001", -- addr 05
        "01001", -- addr 06
        "00000", -- addr 07
        "11000", -- addr 08
        "10000", -- addr 09
        "10100", -- addr 10
        "01000", -- addr 11
        "10001", -- addr 12
        "00111", -- addr 13
        "10111", -- addr 14
        "01011", -- addr 15
        "01101", -- addr 16
        "00101", -- addr 17
        "10011", -- addr 18
        "00110", -- addr 19
        "01010", -- addr 20
        "00011", -- addr 21
        "00010", -- addr 22
        "01100", -- addr 23
        "10110", -- addr 24
        "00001"  -- addr 25
    );
    constant ROM2: rom_type:=(
        "00111", -- addr 00
        "11001", -- addr 01
        "10110", -- addr 02
        "10101", -- addr 03
        "00000", -- addr 04
        "10001", -- addr 05
        "10011", -- addr 06
        "01101", -- addr 07
        "01011", -- addr 08
        "00110", -- addr 09
        "10100", -- addr 10
        "01111", -- addr 11
        "10111", -- addr 12
        "10000", -- addr 13
        "00010", -- addr 14
        "00100", -- addr 15
        "01001", -- addr 16
        "01100", -- addr 17
        "00001", -- addr 18
        "10010", -- addr 19
        "01010", -- addr 20
        "00011", -- addr 21
        "11000", -- addr 22
        "01110", -- addr 23
        "01000", -- addr 24
        "00101"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end Behavioral;
