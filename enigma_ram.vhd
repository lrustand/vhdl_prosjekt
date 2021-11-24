----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2021 08:23:04 AM
-- Design Name: 
-- Module Name: enigma_ram - Behavioral
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

entity enigma_ram is
    Port (
        clk, wr: in std_logic;
        addr, din: in std_logic_vector;
        dout: out std_logic_vector );
end enigma_ram;

architecture Behavioral of enigma_ram is
type ram_t is array(2**addr'length-1 downto 0) of std_logic_vector(din'length-1 downto 0);
signal ram: ram_t;


begin
process (clk)
begin
    if rising_edge(clk) then
        if (wr='1') then
            ram (to_integer(unsigned(addr))) <= din;
         end if;
    end if;
end process;
dout <= ram (to_integer(unsigned(addr)));

end Behavioral;
