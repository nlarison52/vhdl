library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity com is
    port(
        W: in std_logic;     -- Input 1 to AND
        X: in std_logic;     -- Input 2 to AND
        Y: in std_logic;     -- Input to OR
        V: out std_logic;    -- Output of AND gate
        Z: out std_logic     -- Output of OR gate
    );
end com;

architecture behavioral of com is
    signal and_result : std_logic; -- Internal signal for AND gate output
begin

    -- AND gate with 10 ns delay
    and_process: process(W, X)
    begin
        and_result <= W AND X after 10 ns;
    end process;

    -- Assign the internal signal to the output port `V`
    V <= and_result;

    -- OR gate with 5 ns delay
    or_process: process(and_result, Y)
    begin
        Z <= and_result OR Y after 5 ns;
    end process;

end behavioral;
