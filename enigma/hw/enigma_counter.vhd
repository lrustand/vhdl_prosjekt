library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity enigma_counter is
    Port ( 
        clk, rst: in std_logic;
        cnt: out std_logic_vector);
end enigma_counter;

architecture Behavioral of enigma_counter is
begin
    process(clk)
    begin
        if rst = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            cnt <= cnt + '1';
        end if;
    end process;

end Behavioral;
