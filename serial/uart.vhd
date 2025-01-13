library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity uart is
    port(
    clk: in std_logic;
    start: in std_logic;
    data: in std_logic_vector(7 downto 0);
    sdo: out std_logic
        );
end uart;


architecture behavioral of uart is
    constant MAX_COUNT : unsigned(6 downto 0) := to_unsigned(0, 7);
    constant MAX_BIT_COUNT : unsigned(2 downto 0) := to_unsigned(7, 3);
    signal bit_count : unsigned(2 downto 0) := to_unsigned(0, 3);
    signal count : unsigned(6 downto 0) := to_unsigned(0, 7);
    signal sending : std_logic := '0';
    signal shift_reg : std_logic_vector(7 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (sending = '0') then
                sdo <= '0';
                if (start = '1') then
                    sending <= '1';
                    shift_reg <= data;
                    count <= to_unsigned(0, 7);

                end if;

            else
                if (count = MAX_COUNT) then
                    count <= to_unsigned(0, 7);
                    sdo <= shift_reg(0);
                    shift_reg <= '0' & shift_reg(7 downto 1);
                    bit_count <= bit_count + 1;
                else
                    count <= count + 1;
                end if;


                if bit_count = MAX_BIT_COUNT then
                    sending <= '0';
                    bit_count <= to_unsigned(0, 3);
                end if;


            end if;
        end if; 
    end process;

end behavioral;
