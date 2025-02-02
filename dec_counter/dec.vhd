library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec is
    port(
        clk : in std_logic;
        output : out std_logic_vector(3 downto 0)
        );
end entity;


architecture behavior of dec is
    signal i : std_logic_vector(3 downto 0) := "1110";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            i(3) <= (i(3) and not i(0)) or (i(2) and i(1) and i(0));
            i(2) <= (i(2) and not i(1)) or (not i(2) and i(1) and i(0)) or (i(2) and not i(0));
            i(1) <= (i(1) and not i(0)) or (not i(3) and not i(1) and i(0));
            i(0) <= not i(0);
            output <= i;
        end if;
    end process;
end behavior;
