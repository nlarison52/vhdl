library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ss_decoder_tb is
end ss_decoder_tb;


architecture behavior of ss_decoder_tb is
    signal count: std_logic_vector(3 downto 0) := (others => '0');
    signal ss: std_logic_vector(6 downto 0) := (others => '0');

    component ss_decoder is
        port(
            input: in std_logic_vector(3 downto 0);
            output: out std_logic_vector(6 downto 0)
                );
    end component;

begin

    uut : ss_decoder
    port map(
        input => count,
        output => ss
            );

    stim : process
    begin
        for i in 0 to 15 loop
            count <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end behavior;
