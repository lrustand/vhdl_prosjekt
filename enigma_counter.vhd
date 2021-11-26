library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity enigma_counter is
    Port ( 
        clk, rst: in std_logic;
        cnt: out std_logic_vector);
end enigma_counter;

architecture Behavioral of enigma_counter is
    signal counter: std_logic_vector(cnt'length - 1 downto 0);
begin
    process(clk)
    begin
        if rst = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + '1';
        end if;
    end process;
    cnt <= counter;

end Behavioral;
