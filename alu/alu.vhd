library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port(
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        opcode: in std_logic_vector(2 downto 0);
        result: out std_logic_vector(3 downto 0);
        c: out std_logic;
        z: out std_logic
        );
end alu;

architecture behavioral of alu is
    signal result_reg: std_logic_vector(3 downto 0);
    signal carry: std_logic;
    signal zero: std_logic;
begin
    process(a, b, opcode)
        variable sum: signed(4 downto 0);
        variable diff: signed(4 downto 0);

    begin
        if (opcode = "000") then
            result_reg <= a and b;
            carry <= '0';

            if (result_reg = "0000") then 
                zero <= '1';
            else
                zero <= '0';
            end if;
        
        elsif (opcode = "001") then
            result_reg <= a or b;
            carry <= '0';

            if (result_reg = "0000") then 
                zero <= '1';
            else
                zero <= '0';
            end if;

        elsif (opcode = "010") then
            sum := signed('0' & a) + signed('0' & b);
            result_reg <= std_logic_vector(sum(3 downto 0));
            carry <= sum(4);

            if (result_reg = "0000") then 
                zero <= '1';
            else
                zero <= '0';
            end if;

        elsif (opcode = "011") then
            diff := signed('0' & a) - signed('0' & b);
            result_reg <= std_logic_vector(diff(3 downto 0));
            carry <= diff(4);

            if (result_reg = "0000") then 
                zero <= '1';
            else
                zero <= '0';
            end if;

        elsif (opcode = "100") then
            result_reg <= a xor b;
            carry <= '0';

            if (result_reg = "0000") then
                zero <= '1';
            else
                zero <= '0';
            end if;


        elsif (opcode = "101") then
           -- shift R a register (non arithmetic)
            result_reg <= '0' & a(3 downto 1); 

            if (result_reg = "0000") then
                zero <= '1';
            else
                zero <= '0';
            end if;

        elsif (opcode = "110") then 
            -- shift L a register (non arithmetic)
            result_reg <= a(2 downto 0) & '0';

            if (result_reg = "0000") then
                zero <= '1';
            else
                zero <= '0';
            end if;
        else
            result_reg <= a;

            if (result_reg = "0000") then
                zero <= '1';
            else
                zero <= '0';
            end if;
        end if;
        result <= result_reg;
        c <= carry;
        z <= zero;
    end process;
end behavioral;
