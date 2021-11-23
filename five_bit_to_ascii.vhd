----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2021 01:47:32 PM
-- Design Name: 
-- Module Name: five_bit_to_ascii - Behavioral
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

entity five_bit_to_ascii is
    Port (
            clk: in std_logic;
            five_bit_in: std_logic_vector(4 downto 0);
            ascii_out: out std_logic_vector(7 downto 0));
end five_bit_to_ascii;

architecture Behavioral of five_bit_to_ascii is

begin
ascii_out<= "011" & std_logic_vector(unsigned(five_bit_in) + "1");

end Behavioral;
