----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2021 01:48:47 PM
-- Design Name: 
-- Module Name: ascii_to_five_bit - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ascii_to_five_bit is
    Port (
            clk: in std_logic;
            ascii_in: in std_logic_vector(7 downto 0);
            converted_ascii: out std_logic_vector(4 downto 0));
end ascii_to_five_bit;

architecture Behavioral of ascii_to_five_bit is
    
begin
    process(clk)
    begin
        if ascii_in(6 downto 5) >= "10" and ascii_in(4 downto 0) > "00001" and ascii_in(4 downto 0) < "11011" then
            converted_ascii <= std_logic_vector( unsigned(ascii_in(4 downto 0)) - "1" );
        elsif ascii_in = "00001101" then
            converted_ascii <= ascii_in(4 downto 0);
        end if;
    end process;

end Behavioral;
