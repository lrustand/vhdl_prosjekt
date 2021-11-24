library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity rotor is
    -- Size of vectors will be automatically assigned based on external port mapping, comments bellow are the expected values
    port(rst, inc: in std_logic;
        rom_data1, rom_data2, addr_in1, addr_in2: in std_logic_vector(4 downto 0);
        rom_addr1, rom_addr2, addr_out1, addr_out2, index: out std_logic_vector(4 downto 0)
    );
end rotor;

architecture Behavioral of rotor is
    constant LETTERS: integer := 26;
    signal rotate1, rotate_back1, rotate2, rotate_back2: std_logic_vector(addr_in1'length downto 0);
begin
    process(rst, inc) begin
        if(rst='1') then
            index <= "00000";
        elsif(inc'event and inc='1') then
            index <= std_logic_vector(unsigned(index + '1') mod LETTERS);
        end if;
    end process;

    rotate1 <= std_logic_vector(unsigned('0'&addr_in1 + index) mod LETTERS);
    rom_addr1 <= rotate1(4 downto 0);
    rotate_back1 <= std_logic_vector(unsigned('0'&rom_data1 + LETTERS - index) mod LETTERS);
    addr_out1 <= rotate_back1(4 downto 0);

    rotate2 <= std_logic_vector(unsigned('0'&addr_in2 + index) mod LETTERS);
    rom_addr2 <= rotate2(4 downto 0);
    rotate_back2 <= std_logic_vector(unsigned('0'&rom_data2 + LETTERS - index) mod LETTERS);
    addr_out2 <= rotate_back2(4 downto 0);
end Behavioral;
