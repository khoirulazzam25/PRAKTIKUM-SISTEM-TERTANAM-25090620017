library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity testbench dibiarkan kosong karena tidak memiliki port
entity tb_mux4to1 is
end tb_mux4to1;

architecture sim of tb_mux4to1 is
    -- Deklarasi sinyal internal untuk dihubungkan ke DUT (Design Under Test)
    signal sel_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal in0_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal in1_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal in2_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal in3_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal y_tb   : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- Instansiasi DUT ke sinyal testbench
    DUT: entity work.mux4to1
        port map (
            sel => sel_tb,
            in0 => in0_tb,
            in1 => in1_tb,
            in2 => in2_tb,
            in3 => in3_tb,
            y   => y_tb 
        );

    -- Proses pemberian stimulus
    stim_proc: process
    begin
        -- Memberikan nilai awal pada in0 sampai in3 agar mudah diamati di waveform
        in0_tb <= "1010"; -- Nilai A (Hex) atau 10 (Desimal)
        in1_tb <= "1011"; -- Nilai B (Hex) atau 11 (Desimal)
        in2_tb <= "1100"; -- Nilai C (Hex) atau 12 (Desimal)
        in3_tb <= "1101"; -- Nilai D (Hex) atau 13 (Desimal)
        wait for 20 ns;

        -- Skenario 1: Memilih input 0
        sel_tb <= "00"; 
        wait for 20 ns;

        -- Skenario 2: Memilih input 1
        sel_tb <= "01"; 
        wait for 20 ns;

        -- Skenario 3: Memilih input 2
        sel_tb <= "10"; 
        wait for 20 ns;

        -- Skenario 4: Memilih input 3
        sel_tb <= "11"; 
        wait for 20 ns;
        
        wait; -- Hentikan simulasi
    end process;
end sim;