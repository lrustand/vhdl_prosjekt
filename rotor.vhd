library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity rotor is
    -- Size of vectors will be automatically assigned based on external port mapping, comments bellow are the expected values
    port(rom_addr, rom_data, addr_in1, addr_in2: in std_logic_vector(4 downto 0); -- should be 4 downto 0
                                   rst, we, inc: in std_logic;
                           addr_out1, addr_out2: out std_logic_vector(4 downto 0) -- should be same as above
    );
end rotor;

architecture Behavioral of rotor is
    constant LETTERS: integer := 26;
    type ram_type is array(LETTERS-1 downto 0)
        of std_logic_vector(rom_addr'length-1 downto 0);
    signal ram1, ram2: ram_type;
    signal index, downscale1, downscale2: std_logic_vector(rom_addr'length-1 downto 0);
    signal add_mod_ext1a, add_mod_ext1b, add_mod_ext2a, add_mod_ext2b: std_logic_vector(rom_addr'length downto 0);
begin
    process(we) begin
        if(we'event and we='1') then
            ram1(to_integer(unsigned(rom_addr))) <= rom_data;
            ram2(to_integer(unsigned(rom_data))) <= rom_addr;
        end if;
    end process;

    process(rst,inc) begin
        if(rst'event and rst='1') then
            index <= "00000";
        elsif(inc'event and inc='1') then
            index <= std_logic_vector(unsigned(index + '1') mod LETTERS);
        end if;
    end process;

    add_mod_ext1a <= std_logic_vector(unsigned('0'&addr_in1 + index) mod LETTERS);
    downscale1 <= add_mod_ext1a(4 downto 0);
    add_mod_ext1b <= std_logic_vector(unsigned('0'&ram1(to_integer(unsigned(downscale1))) + LETTERS - index) mod LETTERS);
    addr_out1 <= add_mod_ext1b(4 downto 0);
    
    add_mod_ext2a <= std_logic_vector(unsigned('0'&addr_in2 + index) mod LETTERS);
    downscale2 <= add_mod_ext2a(4 downto 0);
    add_mod_ext2b <= std_logic_vector(unsigned('0'&ram2(to_integer(unsigned(downscale2))) + LETTERS - index) mod LETTERS);
    addr_out2 <= add_mod_ext2b(4 downto 0);
end Behavioral;
