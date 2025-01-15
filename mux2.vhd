library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    port(
        in0: in std_logic;
        in1: in std_logic;
        sel: in std_logic;
        output: out std_logic
        );
end mux2;


architecture behavior of mux2 is
begin
    process(in0, in1, sel)
    begin
        if (sel = '0') then
            output <= in0;
        else
            output <= in1;
        end if;
    end process;
end behavior;
