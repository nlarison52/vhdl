library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec_hl is
    port(
            clk : in std_logic;
            reset : in std_logic;
            output : out std_logic_vector(3 downto 0)
        );
end dec_hl;


architecture behavior of dec_hl is
    signal i: unsigned(3 downto 0) := "1011";

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                i <= (others => '0');
            else
                if (i < 9) then
                   i <= i + 1; 
               else
                   i <= (others => '0');
               end if;
            end if;

            output <= std_logic_vector(i);
        end if;
    end process;

end behavior;
