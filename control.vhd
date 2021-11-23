library IEEE;
use IEEE.std_logic_1164.all;


entity control_path is
    port (
        clk : in std_logic;
        input_char : in std_logic;
        rx_done : in std_logic;
        tx_done : in std_logic;
        wheel_roms_cnt : in std_logic;
        wheel_i_cnt : in std_logic;
        wheel_j_cnt : in std_logic;
        wheel_k_cnt : in std_logic;

        tx_en : out std_logic;
        ram_cnt_clr : out std_logic;
        ram_cnt_inc : out std_logic;
        ram_write : out std_logic;
        bypass_mux : out std_logic;
        loopback_mux : out std_logic;
        loopback_reg_load : out std_logic;
        load_wheels : out std_logic;
        wheel_roms_cnt_clr : out std_logic;
        wheel_roms_cnt_inc : out std_logic;

        wheel_i_shift : out std_logic;
        wheel_j_shift : out std_logic;
        wheel_k_shift : out std_logic);
end entity control_path;


architecture arch of control_path is
    variable state : std_logic_vector(2 downto 0) := 0;
begin
    process
    begin
        if state = 0 then
            wheel_roms_cnt_inc <= clk;
            if wheel_roms_cnt > 25 then
                state := 1;
            else
                load_wheels <= clk;
            end if;
        elsif state = 1 then
            load_wheels <= '0';
            wheel_roms_cnt_clr <= '1';
            ram_cnt_clr <= '1';
            state :=2;
        elsif state = 2 then
            loopback_mux <= 0;
            if rx_done = '1' then
                if input_char < 26 then
                    bypass_mux <= '0';
                    state := 3;
                elsif input = 26 then -- Enter
                    state := 5;
                end if;
            end if;
        elsif state = 3 then
            loopback_mux <= '1';
            loopback_reg_load <= '1';
            state := 4;
        elsif state = 4 then
            loopback_reg_load <= '0';
        elsif state = 5 then
        elsif state = 6 then
        end if;
    end process;
end arch;