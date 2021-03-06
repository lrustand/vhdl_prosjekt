library IEEE;
use IEEE.std_logic_1164.all;

entity reg5 is
    Port (
            rst, load : in std_logic;
            din       : in std_logic_vector(4 downto 0);
            dout      : out std_logic_vector(4 downto 0)
          );
end reg5;

architecture arch of reg5 is
begin
   process(rst, load)
   begin
        if (rst='1') then
            dout  <= (others => '0');
        elsif rising_edge(load) then
            dout <= din ;
        end if;
   end process;
end arch;
