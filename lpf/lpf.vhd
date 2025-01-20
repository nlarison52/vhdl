library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity lpf is
begin
    port(
        clk : in std_logic;
        input: in std_logic_vector(7 downto 0);
        output: out std_logic_vector(7 downto 0)
        );
end lpf;


architecture behavior of lpf is
    signal current_input: signed(7 downto 0);
    signal previous_value: signed(7 downto 0);
    signal previous_output: signed(7 downto 0);
    -- a0 = 128, a1 = -65, b0 = 31, b1 = 31
begin
    process(clk) begin
        if rising_edge(clk) then
            
            
        end if;

    end process;
end behavior;
    
