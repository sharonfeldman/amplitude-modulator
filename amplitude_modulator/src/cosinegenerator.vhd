-- (c) Aldec, Inc.
-- All rights reserved.
--
-- Last modified: $Date: 2013-02-19 12:12:43 +0100 (Tue, 19 Feb 2013) $
-- $Revision: 225781 $

library IEEE;
use IEEE.MATH_REAL.all;
use IEEE.numeric_bit.all;

entity CosineGenerator is
    port (
        CLK: in bit;
        CosEnable: in bit;
        CosFreq: in integer;
        COS1: out real
    );
end;

architecture CosineGenerator of CosineGenerator is

    signal VALUE_X : real :=0.0;
    signal delta : real;

begin

    delta <= MATH_PI*real(CosFreq)/1000.0;

    process (clk)
    begin
        if CosEnable='1' then
            if rising_edge(clk) then
                VALUE_X <= "MOD"(VALUE_X+delta, 2.0*MATH_PI);
                COS1 <= COS(VALUE_X);
            end if;
        else
            COS1 <= 1.0;
        end if;
    end process;

end;
