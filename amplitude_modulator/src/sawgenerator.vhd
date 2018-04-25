-- (c) Aldec, Inc.
-- All rights reserved.
--
-- Last modified: $Date: 2013-02-19 12:12:43 +0100 (Tue, 19 Feb 2013) $
-- $Revision: 225781 $

library IEEE;
use IEEE.MATH_REAL.all;
use IEEE.numeric_bit.rising_edge;

entity SawGenerator is
    port (
        CLK: in bit;
        SawEnable: in bit;
        SawFreq: integer;
        SAW1: out real
        );
end;

architecture SawGenerator of SawGenerator is

    signal VALUE_X : real :=0.0;
    signal delta : real;

begin

    delta <= MATH_PI*real(SawFreq)/1000.0;

    process (clk)
    begin
        if SawEnable='1' then
            if rising_edge(clk) then
                VALUE_X <= "MOD"(VALUE_X+delta, 2.0*MATH_PI);
                SAW1 <= VALUE_X * MATH_1_OVER_PI - 1.0;
            end if;
        else
            SAW1 <= 1.0;
        end if;
    end process;

end;
