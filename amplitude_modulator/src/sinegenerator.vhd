-- (c) Aldec, Inc.
-- All rights reserved.
--
-- Last modified: $Date: 2013-02-19 12:12:43 +0100 (Tue, 19 Feb 2013) $
-- $Revision: 225781 $

library IEEE;
use IEEE.MATH_REAL.all;
use IEEE.numeric_bit.rising_edge;

entity SineGenerator is
    port (
        CLK: in bit;
        SinEnable: in bit;
        SinFreq: integer;
        SIN1: out real
    );
end;

architecture SineGenerator of SineGenerator is

    signal VALUE_X : real :=0.0;
    signal delta : real;

begin

    delta <= MATH_PI*real(SinFreq)/1000.0;

    process (clk, SinEnable)
    begin
        if SinEnable='1' then
            if rising_edge(clk) then
                VALUE_X <= "MOD"(VALUE_X+delta, 2.0*MATH_PI);
                SIN1 <= SIN(VALUE_X);
            end if;
        else
            SIN1 <= 1.0;
        end if;
    end process;

end;
