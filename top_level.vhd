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
    --signal tx                : std_logic;
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
    
    signal rom_data11, rom_data21, addr_in11, addr_in21   : std_logic_vector(4 downto 0);
    signal we1, inc1                                      : std_logic;
    signal rom_addr11, rom_addr21, addr_out11, addr_out21 : std_logic_vector(4 downto 0);
    signal addr11, addr21                                 : std_logic_vector(4 downto 0);
    signal data11, data21                                 : std_logic_vector(4 downto 0);

    signal rom_data12, rom_data22, addr_in12, addr_in22   : std_logic_vector(4 downto 0);
    signal we2, inc2                                      : std_logic;
    signal rom_addr12, rom_addr22, addr_out12, addr_out22 : std_logic_vector(4 downto 0);
    signal addr12, addr22                                 : std_logic_vector(4 downto 0);
    signal data12, data22                                 : std_logic_vector(4 downto 0);
    
    signal rom_data13, rom_data23, addr_in13, addr_in23   : std_logic_vector(4 downto 0);
    signal we3, inc3                                      : std_logic;
    signal rom_addr13, rom_addr23, addr_out13, addr_out23 : std_logic_vector(4 downto 0);
    signal addr13, addr23                                 : std_logic_vector(4 downto 0);
    signal data13, data23                                 : std_logic_vector(4 downto 0);

-----------------------------------------------------------------------------------------------------------
begin

    plugboard_in <= converted_ascii when loopback_mux = '0' else loopback_reg_out;
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
        port map(clk => clk, rst => rst, clr => '0', load => loopback_reg_load, din => data21, dout => loopback_reg_out);

-- Plugboard
    plugboard: entity work.plugboard(arch)
        port map(char_in => plugboard_in, char_out => char_out);

-- Rotor I
    rotorI: entity work.rotor(Behavioral)
        port map(rom_data1 => rom_data11, rom_data2 => rom_data21, addr_in1 => addr_in11, addr_in2 => addr_in21,
                 rst => rst, we => we1, inc => inc1, rom_addr1 => rom_addr11, rom_addr2 => rom_addr21, 
                 addr_out1 => addr_out11, addr_out2 => addr_out21);

-- Rotor ROM I
    rotor_rom_I: entity work.rotor_rom_I(Behavioral)
        port map(addr1 => char_out, addr2 => data22, data1 => data11, data2 => data21);

-- Rotor II
    rotorII: entity work.rotor(Behavioral)
        port map(rom_data1 => rom_data12, rom_data2 => rom_data22, addr_in1 => addr_in1, addr_in2 => addr_in22,
                 rst => rst, we => we2, inc => inc2, rom_addr1 => rom_addr12, rom_addr2 => rom_addr22, 
                 addr_out1 => addr_out12, addr_out2 => addr_out22);

-- Rotor ROM II
    rotor_rom_II: entity work.rotor_rom_II(Behavioral)
        port map(addr1 => data11, addr2 => data23, data1 => data12, data2 => data22);

-- Rotor III
    rotorIII: entity work.rotor(Behavioral)
        port map(rom_data1 => rom_data13, rom_data2 => rom_data23, addr_in1 => addr_in13, addr_in2 => addr_in23,
                 rst => rst, we => we3, inc => inc3, rom_addr1 => rom_addr13, rom_addr2 => rom_addr23,
                 addr_out1 => addr_out13, addr_out2 => addr_out23);

-- Rotor ROM III
    rotor_rom_III: entity work.rotor_rom_III(Behavioral)
        port map(addr1 => data12, addr2 => addr23, data1 => data13, data2 => data23);

-- Reflector
    reflector: entity work.reflector(arch)
        port map(char_in => data13, char_out => addr23 );

-- RAM couner
    ram: entity work.enigma_counter(Behavioral )
        port map(clk => clk, rst => rst, cnt => cnt_out);

-- RAM
    ram: entity work.enigma_ram(Behavioral )
        port map(clk => clk, addr => cnt_out, din => ram_in, dout => ram_out);

-- Mod-m counter
    reflector: entity work.mod_m_counter(arch)
        port map(clk => clk, reset => rst, max_tick => s_tick, q => (others => '0'));

-- UART receiver
    uart_rx: entity work.uart_rx(arch)
        port map(clk => clk, rst => rst, rx => din, s_tick => s_tick, rx_done_tick =>rx_done, dout => rx);

-- UART transmitter
    uart_tx: entity work.uart_tx(arch)
        port map(clk => clk, rst => rst, tx_start => tx_en, s_tick => s_tick, din => ram_out, tx_done_tick => tx_done,
                 tx => dout);
end arch;
