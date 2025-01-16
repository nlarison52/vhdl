library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alu_tb is
end alu_tb;


architecture behavioral of alu_tb is 
    component alu
        port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            opcode: in std_logic_vector(2 downto 0);
            result: out std_logic_vector(3 downto 0);
            c: out std_logic;
            z: out std_logic
        );
    end component;

    component counter
        port(
            clk: in std_logic;
            reset: in std_logic;
            enable: in std_logic;
            count: out std_logic_vector(3 downto 0)
        );
    end component;

        signal CLK: std_logic := '0';
        signal RESET: std_logic := '0';
        signal ENABLE: std_logic := '1';  
        signal COUNT: std_logic_vector(3 downto 0) := (others => '0');
        signal A: std_logic_vector(3 downto 0) := (others => '0');
        signal B: std_logic_vector(3 downto 0) := "1001";
        signal RESULT: std_logic_vector(3 downto 0) := (others => '0');
        signal CARRY: std_logic;
        signal ZERO: std_logic;
begin
    u0 : counter
    port map(
        clk => CLK,
        reset => RESET,
        enable => ENABLE,
        count => COUNT
            );
    u1 : alu
    port map(
            a => A,
            b => B,
            opcode => COUNT(2 downto 0),
            result => RESULT,
            c  => CARRY,
            z => ZERO
            );
    stim_process : process
    begin
        for i in 0 to 20 loop
            CLK <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;
end behavioral;
