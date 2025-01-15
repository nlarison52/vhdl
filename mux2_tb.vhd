library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_tb is
end entity;


architecture behavior of mux2_tb is
    component mux2 is
        port(
            in0: in std_logic;
            in1: in std_logic;
            sel: in std_logic;
            output: out std_logic
            );
    end component;
    
        signal IN0: std_logic;
        signal IN1: std_logic;
        signal SEL: std_logic;
        signal OUTPUT: std_logic;

begin
    uut : mux2
    port map(
        in0 => IN0,
        in1 => IN1,
        sel => SEL,
        output => OUTPUT
            );

    stim : process
    begin
        IN0 <= '0';
        IN1 <= '0';
        SEL <= '0';
        wait for 10 ns;

        
        IN0 <= '0';
        IN1 <= '0';
        SEL <= '1';
        wait for 10 ns;

        IN0 <= '0';
        IN1 <= '1';
        SEL <= '0';
        wait for 10 ns;

        IN0 <= '0';
        IN1 <= '1';
        SEL <= '1';
        wait for 10 ns;

        IN0 <= '1';
        IN1 <= '0';
        SEL <= '0';
        wait for 10 ns;
        
        IN0 <= '1';
        IN1 <= '0';
        SEL <= '1';
        wait for 10 ns;
        
        IN0 <= '1';
        IN1 <= '1';
        SEL <= '0';
        wait for 10 ns;
        
        IN0 <= '1';
        IN1 <= '1';
        SEL <= '1';
        wait for 10 ns;
        wait;
    end process;
end behavior;
