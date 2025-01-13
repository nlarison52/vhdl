Library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fa is
    port (
        A: In std_logic;
        B: In std_logic;
        Ci: In std_logic;
        S: Out std_logic;
        Co: Out std_logic
         );
end fa;
         
architecture behavior of fa is
begin
    S <= A xor B xor Ci;
    Co <= (A and B) or (A and Ci) or (B and Ci);
 end behavior;
