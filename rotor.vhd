library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity rotor is
    -- Size of vectors will be automatically assigned based on external port mapping, comments bellow are the expected values
    port(rom_data1, rom_data2, addr_in1, addr_in2: in std_logic_vector(4 downto 0);
                                     rst, we, inc: in std_logic;
       rom_addr1, rom_addr2, addr_out1, addr_out2: out std_logic_vector(4 downto 0)
    );
end rotor;

architecture Behavioral of rotor is
    constant LETTERS: integer := 26;
    signal index, downscale1, downscale2: std_logic_vector(addr_in1'length-1 downto 0);
    signal add_mod_ext1a, add_mod_ext1b, add_mod_ext2a, add_mod_ext2b: std_logic_vector(addr_in1'length downto 0);
begin
    process(rst, inc) begin
        if(rst='1') then
            index <= "00000";
        elsif(inc'event and inc='1') then
            index <= std_logic_vector(unsigned(index + '1') mod LETTERS);
        end if;
    end process;

    add_mod_ext1a <= std_logic_vector(unsigned('0'&addr_in1 + index) mod LETTERS);
    rom_addr1 <= add_mod_ext1a(4 downto 0);
    add_mod_ext1b <= std_logic_vector(unsigned('0'&rom_data1 + LETTERS - index) mod LETTERS);
    addr_out1 <= add_mod_ext1b(4 downto 0);
    
    add_mod_ext2a <= std_logic_vector(unsigned('0'&addr_in2 + index) mod LETTERS);
    rom_addr2 <= add_mod_ext2a(4 downto 0);
    add_mod_ext2b <= std_logic_vector(unsigned('0'&rom_data2 + LETTERS - index) mod LETTERS);
    addr_out2 <= add_mod_ext2b(4 downto 0);
end Behavioral;
