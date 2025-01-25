library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ss_decoder is
    port(
        input: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(6 downto 0)
        );
end ss_decoder;

architecture behavior of ss_decoder is
begin
    process(input)
    begin
        output <= (others => '0');
        case input is
            when "0000" => output <= "1110111";
            when "0001" => output <= "0010010";
            when "0010" => output <= "1011101";
            when "0011" => output <= "1011011";
            when "0100" => output <= "0111010";
            when "0101" => output <= "1101011";
            when "0110" => output <= "1101111";
            when "0111" => output <= "1010010";
            when "1000" => output <= "1111111";
            when "1001" => output <= "1111011";
            when others => null;
        end case;
    end process;
end behavior;
