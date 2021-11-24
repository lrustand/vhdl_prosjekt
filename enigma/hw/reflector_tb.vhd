library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reflector_tb is
end reflector_tb;


architecture arch of reflector_tb is
    signal char_in : std_logic_vector(4 downto 0);
    signal char_out : std_logic_vector(4 downto 0);
    signal previous_char : std_logic_vector(4 downto 0);
begin
        uut: entity work.reflector(arch) port map
        (
            char_in => char_in,
            char_out => char_out
        );

        process is
        begin
            for i in 0 to 25 loop
                char_in <= std_logic_vector(to_unsigned(i, char_in'length));
                wait for 10 ns;
                previous_char <= char_out;
                char_in <= char_out;
                wait for 10 ns;
                report integer'image(i) & " = " & integer'image(to_integer(unsigned(char_out)));
            end loop;
        wait;
    end process;
end arch;
