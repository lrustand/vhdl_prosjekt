----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2021 08:58:23 AM
-- Design Name: 
-- Module Name: enigma_counter - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity enigma_counter is
    Port ( 
        clk, rst: in std_logic;
        cnt: out std_logic_vector);
end enigma_counter;

architecture Behavioral of enigma_counter is
begin
    process(clk)
    begin
        if(rst = '1') then
            cnt<=(others => '0');
        elsif ( rising_edge(clk) ) then
            cnt <= cnt + '1';
        end if;
    end process;

end Behavioral;
