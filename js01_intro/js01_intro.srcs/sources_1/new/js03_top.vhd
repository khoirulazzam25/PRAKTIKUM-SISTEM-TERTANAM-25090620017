library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity js03_top is
    Port ( sw  : in  STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (8 downto 0) ); -- LED diperlebar hingga 9-bit (8-bit result + 1-bit carry)
end js03_top;

architecture Behavioral of js03_top is
    component alu4
        Port ( a      : in STD_LOGIC_VECTOR (3 downto 0);
               b      : in STD_LOGIC_VECTOR (3 downto 0);
               opcode : in STD_LOGIC_VECTOR (1 downto 0);
               result : out STD_LOGIC_VECTOR (7 downto 0);
               carry  : out STD_LOGIC );
    end component;
begin
    U_ALU: alu4 port map (
        a      => sw(3 downto 0),
        b      => sw(7 downto 4),
        opcode => sw(15 downto 14), -- Opcode menggunakan sw[15] dan sw[14]
        result => led(7 downto 0),  -- Result menggunakan led[0] sampai led[7]
        carry  => led(8)            -- Carry menggunakan led[8]
    );
end Behavioral;     