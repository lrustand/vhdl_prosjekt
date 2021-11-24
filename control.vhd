library IEEE;
use IEEE.std_logic_1164.all;


entity control_path is
    port (
        clk : in std_logic;
        input_char : in std_logic_vector(7 downto 0);
        rx_done : in std_logic;
        tx_done : in std_logic;
        rotor_i_cnt : in std_logic_vector(4 downto 0);
        rotor_j_cnt : in std_logic_vector(4 downto 0);
        rotor_k_cnt : in std_logic_vector(4 downto 0);

        tx_en : out std_logic;
        ram_cnt_clr : out std_logic;
        ram_cnt_inc : out std_logic;
        ram_write : out std_logic;
        bypass_mux : out std_logic;
        loopback_mux : out std_logic;
        loopback_reg_load : out std_logic;
        rotors_rst : out std_logic;

        rotor_i_shift : out std_logic;
        rotor_j_shift : out std_logic;
        rotor_k_shift : out std_logic);
end entity control_path;


architecture arch of control_path is
    signal state : std_logic_vector(2 downto 0) := "000";
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

        if state = "000" then
            rotors_rst <= '1';
            ram_cnt_clr <= '1';
            state <="001";
        elsif state = "001" then
            loopback_mux <= '0';
            if rx_done = '1' then
                if (input_char >= x"41" and input_char <= x"5a") or
                   (input_char >= x"61" and input_char <= x"7a") then

                    bypass_mux <= '0';
                    state <= "010";
                elsif input_char = x"0d" then -- Enter
                    bypass_mux <= '1';
                    state <= "100";
                end if;
            end if;
        elsif state = "010" then
            loopback_mux <= '1';
            loopback_reg_load <= '1';
            state <= "011";
        elsif state = "011" then
            ram_write <= '1';
            ram_cnt_inc <= '1';
            rotor_i_shift <= '1';
            if rotor_i_cnt > "11001" then
                rotor_j_shift <= '1';
                if rotor_j_cnt > "11001" then
                    rotor_k_shift <= '1';
                end if;
            end if;
            state <= "001";
        elsif state = "100" then
            ram_write <= '1';
            ram_cnt_clr <= '1';
            state <= "101";
        elsif state = "101" then
            bypass_mux <= '0';
            tx_en <= '1';
            ram_cnt_inc <='1';
            if input_char = x"0d" then
                state <= "000";
            else
                state <= "110";
            end if;
        elsif state = "110" then
            if tx_done = '1' then
                state <= "101";
            end if;
        end if;
    end process;
end arch;
