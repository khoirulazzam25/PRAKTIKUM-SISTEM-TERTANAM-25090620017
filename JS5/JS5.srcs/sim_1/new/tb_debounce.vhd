library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_debounce is
end tb_debounce;

architecture Behavioral of tb_debounce is
    signal clk : STD_LOGIC := '0';
    signal btn_in : STD_LOGIC := '0';
    signal btn_out : STD_LOGIC;
    constant CLK_PERIOD : time := 10 ns;
begin
    uut: entity work.debounce
        generic map (CLK_FREQ_HZ => 100_000_000, STABLE_MS => 2) -- dipercepat untuk simulasi
        port map (clk => clk, btn_in => btn_in, btn_out => btn_out);

    clk_process: process
    begin
        clk <= '0'; wait for CLK_PERIOD/2;
        clk <= '1'; wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;
        -- Simulasi noise/bouncing
        btn_in <= '1'; wait for 0.5 ms;
        btn_in <= '0'; wait for 0.2 ms;
        btn_in <= '1'; wait for 0.3 ms;
        btn_in <= '0'; wait for 0.5 ms;
        -- Tombol ditekan stabil
        btn_in <= '1'; wait for 5 ms;
        -- Simulasi lepas
        btn_in <= '0'; wait for 0.5 ms;
        btn_in <= '1'; wait for 0.2 ms;
        btn_in <= '0'; wait for 5 ms;
        wait;
    end process;
end Behavioral;