library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity lpf is
    port(
        clk : in std_logic;
        input: in std_logic_vector(7 downto 0);
        output: out std_logic_vector(7 downto 0)
        );
end lpf;


architecture behavior of lpf is
    signal current_input: signed(7 downto 0);
    signal previous_input: signed(7 downto 0) := (others => '0');
    signal previous_output: signed(7 downto 0) := (others => '0');
    signal sum: signed(15 downto 0);
    constant a1: signed(7 downto 0) := to_signed(-65, 8);
    constant b0: signed(7 downto 0) := to_signed(31, 8);
    constant b1: signed(7 downto 0) := to_signed(31, 8);
    -- a0 = 128, a1 = -65, b0 = 31, b1 = 31
begin
    process(clk) begin
        if rising_edge(clk) then
            current_input <= signed(input);
            sum <= (current_input * b0 + previous_input * b1 - a1 * previous_output);

            if sum > to_signed(127, 16) then
                previous_output <= to_signed(127, 8);
            elsif sum < to_signed(-128, 16) then
                 previous_output <= to_signed(-128, 8);
            else
                previous_output <= resize(sum, 8);
            end if;

            previous_input <= current_input;
            output <= std_logic_vector(previous_output);
        end if;
    end process;
end behavior;
    
