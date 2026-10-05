library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity updown_counter is
    Port ( clk    : in  STD_LOGIC;
           inc    : in  STD_LOGIC;   -- pulsa dari edge_detect (btnU)
           dec    : in  STD_LOGIC;   -- pulsa dari edge_detect (btnD)
           clr    : in  STD_LOGIC;   -- btnC (debounced)
           freeze : in  STD_LOGIC;   -- TUGAS 2: sw(0) = '1' -> inc/dec diabaikan
           count  : out STD_LOGIC_VECTOR(15 downto 0) );
end updown_counter;

architecture Behavioral of updown_counter is
    signal cnt : unsigned(15 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if clr = '1' then
                cnt <= (others => '0');
            elsif freeze = '0' then
                if inc = '1' then
                    cnt <= cnt + 1;
                elsif dec = '1' then
                    cnt <= cnt - 1;
                end if;
            end if;
        end if;
    end process;
    count <= std_logic_vector(cnt);
end Behavioral;