library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity plugboard is
    port (
        char_in : in std_logic_vector(4 downto 0);
        char_out : out std_logic_vector(4 downto 0));
end plugboard;

architecture arch of plugboard is
    type rom_type is array(0 to 25) of std_logic_vector(4 downto 0);
    constant ROM : rom_type :=
    (
       "00101", --  5, -- A = F
       "01010", -- 10, -- B = K
       "10010", -- 18, -- C = S
       "01001", --  9, -- D = J
       "00100", --  4, -- E unmodified
       "00000", --  0, -- F = A
       "10011", -- 19, -- G = T
       "00111", --  7, -- H unmodified
       "11001", -- 25, -- I = Z
       "00011", --  3, -- J = D
       "00001", --  1, -- K = B
       "01011", -- 11, -- L unmodified
       "01100", -- 12, -- M unmodified
       "11000", -- 24, -- N = Y
       "10101", -- 21, -- O = V
       "10000", -- 16, -- P = Q
       "01111", -- 15, -- Q = P
       "10001", -- 17, -- R unmodified
       "00010", --  2, -- S = C
       "00110", --  6, -- T = G
       "10111", -- 23, -- U = X
       "01110", -- 14, -- V = O
       "10110", -- 22, -- W unmodified
       "10100", -- 20, -- X = U
       "01101", -- 13, -- Y = N
       "01000"  --  8  -- Z = I
     );
begin
    char_out <= ROM(to_integer(unsigned(char_in)));
end arch;
