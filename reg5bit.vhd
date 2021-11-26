library IEEE;
use IEEE.std_logic_1164.all;

entity reg5 is
    Port (
            clk, rst, clr, load : in std_logic;
            din                 : in std_logic_vector(4 downto 0);
            dout                : out std_logic_vector(4 downto 0)
          );
end reg5;

architecture arch of reg5 is
begin
   process(clk, rst)
   begin
        if (rst='1') then
            dout  <= (others => '0');
        elsif rising_edge(clk) then
            if (clr = '1') then
                dout <= (others => '0');
            elsif (load = '1') then
                dout <= din ;
            end if;
        end if;
   end process;
end arch;