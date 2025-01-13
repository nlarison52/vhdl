Library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity fa_tb is
end fa_tb;

architecture behavior of fa_tb is

    component fa
        port(
        A: in std_logic;
        B: in std_logic;
        Ci: in std_logic;
        S: out std_logic;
        Co: out std_logic
            );
    end component;

    signal in1: std_logic;
    signal in2: std_logic;
    signal ci: std_logic;
    signal s: std_logic;
    signal co: std_logic;


begin
    uut : fa

    port map(
        A => in1,
        B => in2,
        Ci => ci,
        S => s,
        Co => co
        
            );
    stimulus_process: process 
    begin
        in1 <= '0';
        in2 <= '0';
        ci <= '0';
        wait for 10 ns;

        in1 <= '0';
        in2 <= '0';
        ci <= '1';
        wait for 10 ns;

        in1 <= '0';
        in2 <= '1';
        ci <= '0';
        wait for 10 ns;
       
        in1 <= '0';
        in2 <= '1';
        ci <= '1';
        wait for 10 ns;

       
        in1 <= '1';
        in2 <= '0';
        ci <= '0';
        wait for 10 ns;

        in1 <= '1';
        in2 <= '0';
        ci <= '1';
        wait for 10 ns;

        in1 <= '1';
        in2 <= '1';
        ci <= '0';
        wait for 10 ns;

        in1 <= '1';
        in2 <= '1';
        ci <= '1';
        wait for 10 ns;
        wait;
    end process;
end behavior;
