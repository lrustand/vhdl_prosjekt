library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reflector is
    port (
        char_in : in std_logic_vector(4 downto 0);
        char_out : out std_logic_vector(4 downto 0));
end reflector;

architecture arch of reflector is
    type rom_type is array(0 to 25) of std_logic_vector(4 downto 0);
    constant ROM : rom_type :=
    (
        -- The default wide B reflector used by Wehrmacht and Luftwaffe
        "11000", -- A = Y
        "10001", -- B = R
        "10100", -- C = U
        "00111", -- D = H
        "10000", -- E = Q
        "10010", -- F = S
        "01011", -- G = L
        "00011", -- H = D
        "01111", -- I = P
        "10111", -- J = X
        "01101", -- K = N
        "00110", -- L = G
        "01110", -- M = O
        "01010", -- N = K
        "01100", -- O = M
        "01000", -- P = I
        "00100", -- Q = E
        "00001", -- R = B
        "00101", -- S = F
        "11001", -- T = Z
        "00010", -- U = C
        "10110", -- V = W
        "10101", -- W = V
        "01001", -- X = J
        "00000", -- Y = A
        "10011"  -- Z = T
     );
begin
    char_out <= ROM(to_integer(unsigned(char_in)));
end arch;
