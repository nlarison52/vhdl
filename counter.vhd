library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    port (
        clk: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        count: out std_logic_vector(3 downto 0)
         );
end counter;


architecture behavioral of counter is
    signal count_reg : std_logic_vector(3 downto 0) := "0000";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                count_reg <= "0000";
            elsif (enable = '1') then
                count_reg <= std_logic_vector(unsigned(count_reg) + 1);
            end if;
         end if; 
     end process;
    count <= count_reg;
end behavioral;
