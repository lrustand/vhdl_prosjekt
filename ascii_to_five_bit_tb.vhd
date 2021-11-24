----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2021 01:59:06 PM
-- Design Name: 
-- Module Name: ascii_to_five_bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ascii_to_five_bit_tb is
--  Port ( );
end ascii_to_five_bit_tb;

architecture Behavioral of ascii_to_five_bit_tb is
    constant clk_period: time:=10 ns;
    
component ascii_to_five_bit
port(
    clk: in std_logic;
    ascii_in: in std_logic_vector(7 downto 0);
    converted_ascii: out std_logic_vector(7 downto 0)
);
end component;
signal clk: std_logic;
signal test_in, test_converted: std_logic_vector(7 downto 0);

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
        test_in <= "01001100";
        wait for clk_period*20;
        test_in <= "01101010";
        wait for clk_period*20;
        test_in <= "01110111";
        wait for clk_period*20;
        test_in <= "00001101";
        wait for clk_period*20;
        wait;
    end process;

end Behavioral;
