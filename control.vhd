library IEEE;
use IEEE.std_logic_1164.all;


entity control_path is
    port (
        clk : in std_logic;
        input_char : in std_logic;
        rx_done : in std_logic;
        tx_done : in std_logic;
        rotor_roms_cnt : in std_logic;
        rotor_i_cnt : in std_logic;
        rotor_j_cnt : in std_logic;
        rotor_k_cnt : in std_logic;

        tx_en : out std_logic;
        ram_cnt_clr : out std_logic;
        ram_cnt_inc : out std_logic;
        ram_write : out std_logic;
        bypass_mux : out std_logic;
        loopback_mux : out std_logic;
        loopback_reg_load : out std_logic;
        load_rotors : out std_logic;
        rotor_roms_cnt_clr : out std_logic;
        rotor_roms_cnt_inc : out std_logic;

        rotor_i_shift : out std_logic;
        rotor_j_shift : out std_logic;
        rotor_k_shift : out std_logic);
end entity control_path;


architecture arch of control_path is
    variable state : std_logic_vector(2 downto 0) := 0;
begin
    process(clk)
    begin
        if state = 0 then
            rotor_roms_cnt_inc <= clk;
            if rotor_roms_cnt > 25 then
                state := 1;
            else
                load_rotors <= clk;
            end if;
        elsif state = 1 then
            load_rotors <= '0';
            rotor_roms_cnt_clr <= '1';
            ram_cnt_clr <= '1';
            state :=2;
        elsif state = 2 then
            loopback_mux <= '0';
            ram_write <= '0';
            ram_cnt_inc <= '0';
            rotor_i_shift <= '0';
            rotor_j_shift <= '0';
            rotor_k_shift <= '0';
            if rx_done = '1' then
                if input_char < 26 then
                    bypass_mux <= '0';
                    state := 3;
                elsif input = 26 then -- Enter
                    bypass_mux <= '1';
                    state := 5;
                end if;
            end if;
        elsif state = 3 then
            loopback_mux <= '1';
            loopback_reg_load <= '1';
            state := 4;
        elsif state = 4 then
            loopback_reg_load <= '0';
            ram_write <= '1';
            ram_cnt_inc <= '1';
            rotor_i_shift <= '1';
            if rotor_i_cnt > 25 then
                rotor_j_shift <= '1';
                if rotor_j_cnt > 25 then
                    rotor_k_shift <= '1';
                end if;
            end if;
            state := 2;
        elsif state = 5 then
            ram_write <= '1';
            ram_cnt_clr <= '1';
            state := 6;
        elsif state = 6 then
            ram_write <= '0';
            ram_cnt_clr <= '0';
            bypass_mux <= '0';
            ram_write <= '0';
            tx_en <= '1';
            ram_cnt_inc <='1';
            if input_char = 26 then
                state := 0;
            else
                state := 7;
            end if;
        elsif state = 7 then
            tx_en <= '0';
            ram_cnt_inc <='0';
            if tx_done = '1' then
                state := 6;
            end if;
        end if;
    end process;
end arch;
