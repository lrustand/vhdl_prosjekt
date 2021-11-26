library IEEE;
use IEEE.std_logic_1164.all;

entity reg5 is
    Port (
            load : in std_logic;
            din  : in std_logic_vector(4 downto 0);
            dout : out std_logic_vector(4 downto 0)
          );
end reg5;

architecture arch of reg5 is
begin
   process(load)
   begin
        if rising_edge(load) then
                dout <= din;
        end if;
   end process;
end arch;