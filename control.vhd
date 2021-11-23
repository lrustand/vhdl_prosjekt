library IEEE;
use IEEE.std_logic_1164.all;


entity control_path is
    port (
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
        loopback_reg : out std_logic;
        load_wheels : out std_logic;
        wheel_roms_cnt_clr : out std_logic;
        wheel_roms_cnt_inc : out std_logic;

        wheel_i_shift : out std_logic;
        wheel_j_shift : out std_logic;
        wheel_k_shift : out std_logic);
end entity control_path;


