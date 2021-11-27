library IEEE;
use IEEE.std_logic_1164.all;

entity top_level is
    port ( 
        clk, rst, din : in std_logic;
        dout          : out std_logic
        );
end top_level;

architecture arch of top_level is
    signal s_tick            : std_logic;
    signal rx                : std_logic;
    signal converted_ascii   : std_logic_vector(4 downto 0);
    signal char_out          : std_logic_vector(4 downto 0);
    signal five_bit_in       : std_logic_vector(4 downto 0);
    signal ascii_out         : std_logic_vector(7 downto 0);
    
    signal cnt_out           : std_logic_vector(4 downto 0);
    signal wr                : std_logic;
    
    signal input_char        : std_logic_vector(7 downto 0);
    signal rx_done           : std_logic;
    signal tx_done           : std_logic;
    
    signal rotor_i_cnt       : std_logic_vector(4 downto 0);
    signal rotor_j_cnt       : std_logic_vector(4 downto 0);
    signal rotor_k_cnt       : std_logic_vector(4 downto 0);

    signal tx_en             : std_logic;
    signal ram_cnt_clr       : std_logic;
    signal ram_cnt_inc       : std_logic;
    signal ram_write         : std_logic;
    signal bypass_mux        : std_logic;
    signal loopback_mux      : std_logic;
    signal loopback_reg_load : std_logic;
    
    signal rotor_rst         : std_logic;
    signal rotor_i_shift     : std_logic;
    signal rotor_j_shift     : std_logic;
    signal rotor_k_shift     : std_logic;
    
    signal loopback_reg_out  : std_logic_vector(4 downto 0);
    signal plugboard_in      : std_logic_vector(4 downto 0);
    signal ram_in            : std_logic_vector(7 downto 0);
    signal ram_out           : std_logic_vector(7 downto 0);
    
    signal rotor_i_rom_data1, rotor_i_rom_data2 : std_logic_vector(4 downto 0);
    signal rotor_i_addr_in2                     : std_logic_vector(4 downto 0);
    signal rotor_i_rom_addr1, rotor_i_rom_addr2 : std_logic_vector(4 downto 0);
    signal rotor_i_addr_out1, rotor_i_addr_out2 : std_logic_vector(4 downto 0);
    signal rotor_i_inc                          : std_logic;

    signal rotor_j_rom_data1, rotor_j_rom_data2 : std_logic_vector(4 downto 0);
    signal rotor_j_addr_in2                     : std_logic_vector(4 downto 0);
    signal rotor_j_rom_addr1, rotor_j_rom_addr2 : std_logic_vector(4 downto 0);
    signal rotor_j_addr_out1, rotor_j_addr_out2 : std_logic_vector(4 downto 0);
    signal rotor_j_inc                          : std_logic;
    
    signal rotor_k_rom_data1, rotor_k_rom_data2 : std_logic_vector(4 downto 0);
    signal rotor_k_addr_in2                     : std_logic_vector(4 downto 0);
    signal rotor_k_rom_addr1, rotor_k_rom_addr2 : std_logic_vector(4 downto 0);
    signal rotor_k_addr_out1, rotor_k_addr_out2 : std_logic_vector(4 downto 0);
    signal rotor_k_inc                            : std_logic;

-----------------------------------------------------------------------------------------------------------
begin
-- Multiplexers
    -- Loopback
    plugboard_in <= converted_ascii when loopback_mux = '0' else loopback_reg_out;
    -- Bypass
    ram_in <= ascii_out when bypass_mux = '0' else converted_ascii;

-- Control path
    control: entity work.control_path(arch)
        port map(clk => clk, input_char => dout, rx_done => rx_done, tx_done => tx_done,
                  rotor_i_cnt => rotor_i_cnt, rotor_j_cnt => rotor_j_cnt, rotor_k_cnt => rotor_k_cnt, tx_en => tx_en,
                  ram_cnt_clr => ram_cnt_clr, ram_cnt_inc => ram_cnt_inc, ram_write => ram_write, bypass_mux => bypass_mux,
                  loopback_mux => loopback_mux, loopback_reg_load => loopback_reg_load, rotor_rst => rotor_rst, 
                  rotor_i_shift => rotor_i_shift, rotor_j_shift => rotor_j_shift, rotor_k_shift => rotor_k_shift);

-- ASCII converter (to five bit)
    ascii_to_five_bit: entity work.ascii_to_five_bit(Behavioral)
        port map(clk => clk, ascii_in => rx, converted_ascii => converted_ascii);
                    
-- ASCII converter (to ASCII)
    five_bit_to_ascii: entity work.five_bit_to_ascii(Behavioral)
        port map(clk => clk, five_bit_in => char_out, ascii_out => ascii_out);

-- Loopback register
    loopback_reg: entity work.reg5(arch)
        port map(load => loopback_reg_load, din => rotor_i_addr_out2, dout => loopback_reg_out);

-- Plugboard
    plugboard: entity work.plugboard(arch)
        port map(char_in => plugboard_in, char_out => char_out);

-- Rotor i
    rotor_i: entity work.rotor(Behavioral)
        port map(rom_data1 => rotor_i_rom_data1, rom_data2 => rotor_i_rom_data2, addr_in1 => char_out, 
                 addr_in2 => rotor_j_addr_out2, rst => rotor_rst, inc => rotor_i_inc, rom_addr1 => rotor_i_rom_addr1,
                 rom_addr2 => rotor_i_rom_addr2, addr_out1 => rotor_i_addr_out1, addr_out2 => rotor_i_addr_out2, 
                 index => rotor_i_cnt);

    rotor_rom_I: entity work.rotor_rom_I(Behavioral)
        port map(addr1 => rotor_i_rom_addr1, addr2 => rotor_i_rom_addr2, data1 => rotor_i_rom_data1, 
                 data2 => rotor_i_rom_data2);

-- Rotor j
    rotor_j: entity work.rotor(Behavioral)
        port map(rom_data1 => rotor_j_rom_data1, rom_data2 => rotor_j_rom_data2, addr_in1 => rotor_i_addr_out1,
                 addr_in2 => rotor_k_addr_out2, rst => rotor_rst, inc => rotor_j_inc, rom_addr1 => rotor_j_rom_addr1,
                 rom_addr2 => rotor_j_rom_addr2, addr_out1 => rotor_j_addr_out1, addr_out2 => rotor_j_addr_out2,
                 index => rotor_j_cnt);

    rotor_rom_II: entity work.rotor_rom_II(Behavioral)
        port map(addr1 => rotor_j_rom_addr1, addr2 => rotor_j_rom_addr2, data1 => rotor_j_rom_data1,
                 data2 => rotor_j_rom_data2);

-- Rotor k
    rotor_k: entity work.rotor(Behavioral)
        port map(rom_data1 => rotor_k_rom_data1, rom_data2 => rotor_k_rom_data2, addr_in1 => rotor_j_addr_out1,
                 addr_in2 => rotor_k_addr_in2, rst => rotor_rst, inc => rotor_k_inc, rom_addr1 => rotor_k_rom_addr1,
                 rom_addr2 => rotor_k_rom_addr2, addr_out1 => rotor_k_addr_out1, addr_out2 => rotor_k_addr_out2,
                 index => rotor_k_cnt);

    rotor_rom_III: entity work.rotor_rom_III(Behavioral)
        port map(addr1 => rotor_k_rom_addr1, addr2 => rotor_k_rom_addr2, data1 => rotor_k_rom_data1, 
                 data2 => rotor_k_rom_data2);

-- Reflector
    reflector: entity work.reflector(arch)
        port map(char_in => rotor_k_addr_out1, char_out => rotor_k_addr_in2);

-- RAM couner
    ram_cnt: entity work.enigma_counter(Behavioral )
        port map(clk => clk, rst => rst, cnt => cnt_out);

-- RAM
    ram: entity work.enigma_ram(Behavioral )
        port map(clk => clk, addr => cnt_out, din => ram_in, dout => ram_out);

-- Mod-m counter
    modm_cnt: entity work.mod_m_counter(arch)
        port map(clk => clk, reset => rst, max_tick => s_tick, q => (others => '0'));

-- UART receiver
    uart_rx: entity work.uart_rx(arch)
        port map(clk => clk, rst => rst, rx => din, s_tick => s_tick, rx_done_tick =>rx_done, dout => rx);

-- UART transmitter
    uart_tx: entity work.uart_tx(arch)
        port map(clk => clk, rst => rst, tx_start => tx_en, s_tick => s_tick, din => ram_out, tx_done_tick => tx_done,
                 tx => dout);
end arch;
