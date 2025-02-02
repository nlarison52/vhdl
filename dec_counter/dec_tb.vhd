library ieee;
use ieee.std_logic_1164.all;

entity dec_tb is
end entity;


architecture behavior of dec_tb is
    signal CLK: std_logic := '0'; 
    signal OUTPUT: std_logic_vector(3 downto 0);

    component dec is
        port(
            clk: in std_logic;
            output: out std_logic_vector(3 downto 0)
            );
    end component;
begin
    uut : dec
    port map(
    CLK => clk,
    OUTPUT => output
            );


    stim : process
    begin
        for i in 0 to 15 loop
            CLK <= not CLK;
            wait for 10 ns;
            CLK <= not CLK;
            wait for 10 ns;
        end loop;
        wait;
    end process;

end behavior;
