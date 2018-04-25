-- (c) Aldec, Inc.
-- All rights reserved.
--
-- Last modified: $Date: 2013-02-19 12:12:43 +0100 (Tue, 19 Feb 2013) $
-- $Revision: 225781 $

library IEEE;
use IEEE.MATH_REAL.all;
use IEEE.numeric_bit.rising_edge;

entity Multiplier is
    port (
        clk: in bit;
        IN1: in real;
        IN2: in real;
        IN3: in real;
        OUT1: out real
    );
end;

architecture Multiplier of Multiplier is

    signal VALUE_X : real range 0.0 to 7.0;

begin

    process (clk)
    begin
        if rising_edge(clk) then
            OUT1 <= IN1 * IN2 * IN3;
        end if;
    end process;

end;
