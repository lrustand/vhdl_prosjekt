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
use IEEE.STD_LOGIC_1164.ALL;
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
            converted_ascii: out std_logic_vector(7 downto 0));
end ascii_to_five_bit;

architecture Behavioral of ascii_to_five_bit is
    
begin
    process(clk)
    begin
        if ( ascii_in(7 downto 5) >= "010" and ascii_in(4 downto 0) > "0001" and ascii_in(4 downto 0) < "11011" ) then
            converted_ascii <= "000" & std_logic_vector( unsigned(ascii_in(4 downto 0)) - "1" );
        end if;
    end process;

end Behavioral;
