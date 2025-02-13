library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
            clk: in std_logic;
            x: in std_logic;
            q: out std_logic_vector(2 downto 1);
            z: out std_logic
         );
end fsm;


architecture behavior of fsm is
    signal qi: std_logic_vector(2 downto 1) := "00";
    signal k: std_logic_vector(2 downto 1);
    signal j: std_logic_vector(2 downto 1);


begin
    process(clk) 
    begin
        if rising_edge(clk) then
            j(1) <= x and  qi(2);
            j(2) <= x and not qi(1);
            k <= (others => x);

            qi <= (j and not qi) or (not k and qi);
        end if;
        q <= qi;
        z <= x xor qi(2);
    end process;
end behavior;
