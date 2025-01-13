library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity com_tb is
end com_tb;

architecture Behavioral of com_tb is
    -- Component declaration for the unit under test (UUT)
    component com
        port(
            W: in std_logic;
            X: in std_logic;
            Y: in std_logic;
            V: out std_logic;
            Z: out std_logic
        );
    end component;

    -- Signals to connect to the UUT
    signal W : std_logic := '0';
    signal X : std_logic := '0';
    signal Y : std_logic := '0';
    signal V : std_logic;
    signal Z : std_logic;
begin

    -- Instantiate the UUT
    uut: com
        port map (
            W => W,
            X => X,
            Y => Y,
            V => V,
            Z => Z
        );

    -- Test process to apply stimuli
    stimulus: process
    begin
        -- Initial state
        W <= '0'; X <= '0'; Y <= '0';
        wait for 5 ns;

        -- Test Case 1: W=1, X=0, Y=0
        W <= '0'; X <= '1'; Y <= '0';
        wait for 5 ns;

        -- Test Case 2: W=1, X=1, Y=0
        W <= '1'; X <= '1'; Y <= '1';
        wait for 5 ns;

        -- Test Case 3: W=1, X=1, Y=1
        W <= '1'; X <= '0'; Y <= '1';
        wait for 5 ns;

        -- Test Case 4: W=0, X=1, Y=1
        W <= '0'; X <= '0'; Y <= '1';
        wait for 10 ns;

        W <= '1'; X <= '1'; Y <= '1';
        wait for 5 ns;
        -- End simulation
        
        W <= '1'; X <= '1'; Y <= '0';
        wait for 5 ns;
        
        W <= '1'; X <= '0'; Y <= '0';
        wait for 15 ns;


        wait;
    end process;

end Behavioral;
