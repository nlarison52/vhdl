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
            opcode: in std_logic_vector(1 downto 0);
            result: out std_logic_vector(3 downto 0);
            carry: out std_logic
        );
    end component;

        signal A: std_logic_vector(3 downto 0) := "1010";
        signal B: std_logic_vector(3 downto 0) := "1001";
        signal OPCODE: std_logic_vector(1 downto 0) := (others => '0');
        signal RESULT: std_logic_vector(3 downto 0) := (others => '0');
        signal CARRY: std_logic;
begin
    uut : alu
    port map(
            a => A,
            b => B,
            opcode => OPCODE,
            result => RESULT,
            carry => CARRY
            );
    stim_process : process
    begin
        OPCODE <= "00";
        wait for 10 ns;

        OPCODE <= "01";
        wait for 10 ns;

        OPCODE <= "10";
        wait for 10 ns;

        OPCODE <= "11";
        wait for 10 ns;
        wait;
    end process;
end behavioral;
