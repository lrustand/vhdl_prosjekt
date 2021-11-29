library IEEE;
use IEEE.std_logic_1164.all;


entity control_path is
    port (
        clk: in std_logic;
        input_char: in std_logic_vector(7 downto 0);
        rx_done: in std_logic;
        tx_done: in std_logic;
        rotor_i_cnt: in std_logic_vector(4 downto 0);
        rotor_j_cnt: in std_logic_vector(4 downto 0);
        rotor_k_cnt: in std_logic_vector(4 downto 0);

        tx_en: out std_logic;
        ram_cnt_clr: out std_logic;
        ram_cnt_inc: out std_logic;
        ram_write: out std_logic;
        bypass_mux: out std_logic;
        loopback_mux: out std_logic;
        loopback_reg_load: out std_logic;
        rotors_rst: out std_logic;

        rotor_i_shift: out std_logic;
        rotor_j_shift: out std_logic;
        rotor_k_shift: out std_logic);
end entity control_path;


architecture arch of control_path is
    type state_type is (
        INIT,
        READ,
        LOOPBACK,
        STORE,
        ENDLINE,
        TX_START,
        TX_WAIT
    );
    signal state: state_type;
begin
    process(clk)
    begin
        tx_en <= '0';
        ram_cnt_clr <= '0';
        ram_cnt_inc <= '0';
        ram_write <= '0';
        loopback_reg_load <= '0';
        rotor_i_shift <= '0';
        rotor_j_shift <= '0';
        rotor_k_shift <= '0';
        rotors_rst <= '0';

        if state = INIT then
            bypass_mux <= '0';
            rotors_rst <= '1';
            ram_cnt_clr <= '1';
            state <= READ;
        elsif state = READ then
            loopback_mux <= '0';
            if rx_done = '1' then
                if (input_char >= x"41" and input_char <= x"5a") or
                   (input_char >= x"61" and input_char <= x"7a") then

                    bypass_mux <= '0';
                    state <= LOOPBACK;
                elsif input_char = x"0d" then -- Enter
                    bypass_mux <= '1';
                    state <= ENDLINE;
                end if;
            end if;
        elsif state = LOOPBACK then
            loopback_mux <= '1';
            loopback_reg_load <= '1';
            state <= STORE;
        elsif state = STORE then
            ram_write <= '1';
            ram_cnt_inc <= '1';
            rotor_i_shift <= '1';
            if rotor_i_cnt = "11001" then
                rotor_j_shift <= '1';
                if rotor_j_cnt = "11001" then
                    rotor_k_shift <= '1';
                end if;
            end if;
            state <= READ;
        elsif state = ENDLINE then
            ram_write <= '1';
            ram_cnt_clr <= '1';
            state <= TX_START;
        elsif state = TX_START then
            tx_en <= '1';
            if input_char = x"0d" then
                state <= INIT;
            else
                state <= TX_WAIT;
            end if;
        elsif state = TX_WAIT then
            if tx_done = '1' then
                state <= TX_START;
            end if;
        end if;
    end process;
end arch;
