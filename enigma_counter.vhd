library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity enigma_counter is
    Port ( 
        clk, rst: in std_logic;
        cnt: out std_logic_vector);
end enigma_counter;

architecture Behavioral of enigma_counter is
    signal counter: unsigned(cnt'length - 1 downto 0);
begin
    process(clk)
    begin
        if rst = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;
    cnt <= std_logic_vector(counter);

end Behavioral;
