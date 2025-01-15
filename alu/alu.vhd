library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port(
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        opcode: in std_logic_vector(1 downto 0);
        result: out std_logic_vector(3 downto 0);
        carry: out std_logic
        );
end alu;

architecture behavioral of alu is
begin
    process(a, b, opcode)
        variable sum: signed(4 downto 0);
        variable diff: signed(4 downto 0);

    begin
        if (opcode = "00") then
            result <= a and b;
            carry <= '0';
        
        elsif (opcode = "01") then
            result <= a or b;
            carry <= '0';

        elsif (opcode = "10") then
            sum := signed('0' & a) + signed('0' & b);
            result <= std_logic_vector(sum(3 downto 0));
            carry <= sum(4);

        else
            diff := signed('0' & a) - signed('0' & b);
            result <= std_logic_vector(diff(3 downto 0));
            carry <= diff(4);

        end if;
    end process;
end behavioral;
