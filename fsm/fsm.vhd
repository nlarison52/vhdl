library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
            clk: in std_logic;
            x: in std_logic;
            q: out std_logic_vector(1 downto 0);
            z: out std_logic
         );
end fsm;


architecture behavior of fsm is
    signal qi: std_logic_vector(1 downto 0) := "00";
begin
    process(clk) 
    begin
        if rising_edge(clk) then
            qi(1) <= (not x and qi(0)) or (x and qi(1) and not qi(0));
            qi(0) <= (not x and qi(1)) or (x and not qi(1) and not qi(0));
            z <= qi(1) xor x;

            q(1) <= qi(1);
            q(0) <= qi(0);
        end if;

    end process;
end behavior;
