library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity five_bit_to_ascii is
    Port (
        five_bit_in: std_logic_vector(4 downto 0);
        ascii_out: out std_logic_vector(7 downto 0));
end five_bit_to_ascii;

architecture arch of five_bit_to_ascii is
begin
    ascii_out<="011" & std_logic_vector(unsigned(five_bit_in) + "1");

end arch;
