library ieee;
use ieee.std_logic_1164.all;

entity ascii_to_five_bit_tb is
--  Port ( );
end ascii_to_five_bit_tb;

architecture Behavioral of ascii_to_five_bit_tb is
    constant clk_period: time:=10 ns;

    component ascii_to_five_bit
        port(
            clk: in std_logic;
            ascii_in: in std_logic_vector(7 downto 0);
            converted_ascii: out std_logic_vector(4 downto 0)
        );
    end component;

    signal clk: std_logic;
    signal test_in: std_logic_vector(7 downto 0);
    signal test_converted: std_logic_vector(4 downto 0);

begin
    uut: ascii_to_five_bit port map (
        clk=>clk,
        ascii_in=>test_in,
        converted_ascii=>test_converted);

    clk_prosess: process
    begin
        clk<='0';
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        end process;

    strim: process
    begin
        test_in <= x"4c";
        wait for clk_period*20;
        test_in <= x"69";
        wait for clk_period*20;
        test_in <= x"77";
        wait for clk_period*20;
        test_in <= x"0d";
        wait for clk_period*20;
        wait;
    end process;

end Behavioral;
