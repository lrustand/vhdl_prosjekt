library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rotor is
    -- Size of vectors will be automatically assigned based on external port mapping, comments bellow are the expected values
    port(addr_write, data_load, addr_in, addr_in_loopback: in std_logic_vector(4 downto 0); -- should be 4 downto 0
                                                  we, inc: in std_logic;
                              addr_out, addr_out_loopback: out std_logic_vector(4 downto 0) -- should be same as write/in/loopback
    );
end rotor;

architecture Behavioral of rotor is
    constant LETTERS: integer := 26;
    type ram_type is array(LETTERS-1 downto 0)
        of std_logic_vector(addr_write'length-1 downto 0);
    signal ram:          ram_type;
    signal ram_loopback: ram_type;
    signal index:        std_logic_vector(addr_write'length-1 downto 0);
begin
    process(we) begin
        if(we'event and we='1') then
            ram(to_integer(unsigned(addr_write)))         <= data_load;
            ram_loopback(to_integer(unsigned(data_load))) <= addr_write;
        end if;
    end process;

    process(inc) begin
        if(inc'event and inc='1') then
            index <= std_logic_vector(to_unsigned((to_integer(unsigned(index)) + 1) mod LETTERS, index'length));
        end if;
    end process;

    addr_out          <= std_logic_vector(unsigned(ram(to_integer(unsigned(addr_in)+unsigned(index)) mod LETTERS)) - unsigned(index) mod LETTERS);
    addr_out_loopback <= std_logic_vector(unsigned(ram(to_integer(unsigned(addr_in_loopback)+unsigned(index)) mod LETTERS)) - unsigned(index) mod LETTERS);
end Behavioral;
