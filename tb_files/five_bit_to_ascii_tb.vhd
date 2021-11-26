library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity five_bit_to_ascii_tb is
--  Port ( );
end five_bit_to_ascii_tb;

architecture Behavioral of five_bit_to_ascii_tb is
    constant clk_period: time:=10 ns;

    component five_bit_to_ascii
        port(
            clk: in std_logic;
            five_bit_in: in std_logic_vector(4 downto 0);
            ascii_out: out std_logic_vector(7 downto 0)
        );
    end component;

    signal clk: std_logic;
    signal test_converted: std_logic_vector(7 downto 0);
    signal test_in: std_logic_vector(4 downto 0);

begin
    uut: five_bit_to_ascii port map (
        clk=>clk,
        five_bit_in=>test_in,
        ascii_out=>test_converted);

    clk_prosess: process
    begin
        clk<='0';
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        end process;

    strim: process
    begin
        test_in <= x"0c";
        wait for clk_period*20;
        test_in <= x"0a";
        wait for clk_period*20;
        test_in <= x"17";
        wait for clk_period*20;
        wait;
    end process;

end Behavioral;