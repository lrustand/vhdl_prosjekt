library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
    Port (
        wr: in std_logic;
        addr, din: in std_logic_vector;
        dout: out std_logic_vector );
end ram;

architecture arch of ram is
    type ram_t is array(2**addr'length-1 downto 0) of std_logic_vector(din'length-1 downto 0);
    signal ram: ram_t;

begin
    process (wr)
    begin
        if rising_edge(wr) then
            ram (to_integer(unsigned(addr))) <= din;
        end if;
    end process;
dout <= ram (to_integer(unsigned(addr)));

end arch;
