library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_tb is
end counter_tb;

architecture behavioral of counter_tb is
    component counter
        port(
            enable: in std_logic;
            reset: in std_logic;
            clk: in std_logic;
            count: out std_logic_vector(3 downto 0)
            );
    end component;

        signal EN: std_logic;
        signal RE: std_logic;
        signal CLK: std_logic;
        signal COUNT: std_logic_vector(3 downto 0);
begin
    uut : counter

    port map(
        enable => EN,
        reset => RE,
        clk => CLK,
        count => COUNT
            );

    simulus_process: process
    begin
        for i in 0 to 7 loop
            if (i = 3) then
               RE <= '1';
           else
               RE <= '0';
           end if;
            CLK <= '1';
            EN <= '1';
            wait for 5 ns;
            CLK <= '0';
            wait for 5 ns;
        end loop;
        
        wait;
    end process;       
end behavioral;
