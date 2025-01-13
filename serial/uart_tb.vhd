library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tb is
end uart_tb;

architecture behavioral of uart_tb is

    -- Component Declaration
    component uart
        port (
            clk   : in  std_logic;
            start : in  std_logic;
            data  : in  std_logic_vector(7 downto 0);
            sdo   : out std_logic
        );
    end component;

    -- Testbench Signals
    signal clk   : std_logic := '0';
    signal start : std_logic := '0';
    signal data  : std_logic_vector(7 downto 0) := (others => '0');
    signal sdo   : std_logic;

    -- Clock period for 1 MHz clock
    constant CLK_PERIOD : time := 1 us;

begin

    -- Instantiate UART DUT (Device Under Test)
    uut: uart
        port map (
            clk   => clk,
            start => start,
            data  => data,
            sdo   => sdo
        );

    -- Clock Process with a Finite Number of Cycles
    clk_process : process
    begin
        for i in 0 to 999 loop   -- For example, 1000 clock cycles
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;

        -- Stop the simulation after 1000 cycles
        report "Simulation completed." severity note;
        assert false
        report "simulation ended"
        severity failure;
        wait;
    end process clk_process;

    -- Example Stimulus Process
    stimulus_process : process
    begin
        -- Wait a few cycles
        wait for 5 * CLK_PERIOD;

        -- Drive start high and set data
        start <= '1';
        data <= "10101011";  -- example pattern
        wait for CLK_PERIOD;  -- hold start high for at least one cycle
        start <= '0';

        -- Wait a bit more before finishing
        wait for 20 * CLK_PERIOD;

        -- (We rely on the clk_process to eventually end the simulation)
        wait;
    end process stimulus_process;

end behavioral;
