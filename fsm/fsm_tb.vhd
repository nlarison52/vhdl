library ieee;
use ieee.std_logic_1164.all;


entity fsm_tb is 
end fsm_tb;


architecture behavior of fsm_tb is
    component fsm is
        port(
        clk: in std_logic;
        x: in std_logic;
        q: out std_logic_vector(1 downto 0);
        z: out std_logic
            );
    end component;

    signal CLK: std_logic := '0';
    signal X: std_logic := '1';
    signal Q: std_logic_vector(1 downto 0);
    signal Z: std_logic;


begin
    uut : fsm
    port map(
            CLK => clk,
            X => x,
            Q => q,
            Z => z
            );
    stim : process
    begin
        for i in 0 to 15 loop
            CLK <= '1';
            wait for 5 ns;
            CLK <= '0';
            wait for 5 ns;
        end loop;


        wait;
    end process;

end behavior;
