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
        x"04", -- addr 00
        x"12", -- addr 01
        x"0e", -- addr 02
        x"15", -- addr 03
        x"0f", -- addr 04
        x"19", -- addr 05
        x"09", -- addr 06
        x"00", -- addr 07
        x"18", -- addr 08
        x"10", -- addr 09
        x"14", -- addr 10
        x"08", -- addr 11
        x"11", -- addr 12
        x"07", -- addr 13
        x"17", -- addr 14
        x"0b", -- addr 15
        x"0d", -- addr 16
        x"05", -- addr 17
        x"13", -- addr 18
        x"06", -- addr 19
        x"0a", -- addr 20
        x"03", -- addr 21
        x"02", -- addr 22
        x"0c", -- addr 23
        x"16", -- addr 24
        x"01"  -- addr 25
    );
    constant ROM2: rom_type:=(
        x"07", -- addr 00
        x"19", -- addr 01
        x"16", -- addr 02
        x"15", -- addr 03
        x"00", -- addr 04
        x"11", -- addr 05
        x"13", -- addr 06
        x"0d", -- addr 07
        x"0b", -- addr 08
        x"06", -- addr 09
        x"14", -- addr 10
        x"0f", -- addr 11
        x"17", -- addr 12
        x"10", -- addr 13
        x"02", -- addr 14
        x"04", -- addr 15
        x"09", -- addr 16
        x"0c", -- addr 17
        x"01", -- addr 18
        x"12", -- addr 19
        x"0a", -- addr 20
        x"03", -- addr 21
        x"18", -- addr 22
        x"0e", -- addr 23
        x"08", -- addr 24
        x"05"  -- addr 25
    );
begin
   data1 <= ROM1(to_integer(unsigned(addr1)));
   data2 <= ROM2(to_integer(unsigned(addr2)));
end Behavioral;
