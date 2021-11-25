library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ascii_to_five_bit is
    Port (
        clk: in std_logic;
        ascii_in: in std_logic_vector(7 downto 0);
        converted_ascii: out std_logic_vector(4 downto 0));
end ascii_to_five_bit;

architecture Behavioral of ascii_to_five_bit is
begin
    process(clk)
    begin
        if ascii_in(6 downto 5) >= x"2" and ascii_in(4 downto 0) >= x"1" and ascii_in(4 downto 0) < x"1b" then
            converted_ascii <= std_logic_vector( unsigned(ascii_in(4 downto 0)) - "1" );
        elsif ascii_in = x"0d" then
            converted_ascii <= ascii_in(4 downto 0);
        end if;
    end process;

end Behavioral;
