library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ascii_to_five_bit is
    Port (
        ascii_in: in std_logic_vector(7 downto 0);
        converted_ascii: out std_logic_vector(4 downto 0));
end ascii_to_five_bit;

architecture arch of ascii_to_five_bit is
begin
    process(ascii_in)
    begin
        if (ascii_in > x"40" and ascii_in < x"5b") or (ascii_in > x"60" and ascii_in < x"7b") then
            converted_ascii <= std_logic_vector( unsigned(ascii_in(4 downto 0)) - "1" );
        else
            converted_ascii <= (others => '0');
        end if;
    end process;

end arch;
