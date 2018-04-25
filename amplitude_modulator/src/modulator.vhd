-- (c) Aldec, Inc.
-- All rights reserved.
--
-- Last modified: $Date: 2013-02-19 12:12:43 +0100 (Tue, 19 Feb 2013) $
-- $Revision: 225781 $

library IEEE;
use IEEE.std_logic_1164.all;

entity Modulator is
    port (
        CosEnable : in bit;
        CosFreq : in integer;
        SawEnable : in bit;
        SawFreq : in integer;
        SinEnable : in bit;
        SinFreq : in integer;
        clk : in bit;
        OUTPUT : out real
    );
end;

architecture MODULATOR of Modulator is

    signal COS1 : real;
    signal SAW1 : real;
    signal SIN1 : real;

-- Component declarations

component CosineGenerator
    port (
        CLK : in BIT;
        CosEnable : in BIT;
        CosFreq : in INTEGER;
        COS1 : out REAL
    );
end component;

component Multiplier
    port (
        IN1 : in REAL;
        IN2 : in REAL;
        IN3 : in REAL;
        clk : in bit;
        out1 : out real
    );
end component;

component SawGenerator
    port (
        CLK : in BIT;
        SawEnable : in BIT;
        SawFreq : in INTEGER;
        SAW1 : out REAL
    );
end component;

component SineGenerator
    port (
        CLK : in BIT;
        SinEnable : in BIT;
        SinFreq : in INTEGER;
        SIN1 : out REAL
    );
end component;

begin

-- Component instantiations

U0 : SineGenerator
    port map (
        CLK => clk,
        SIN1 => SIN1,
        SinEnable => SinEnable,
        SinFreq => SinFreq
    );

U1 : CosineGenerator
    port map (
        CLK => clk,
        COS1 => COS1,
        CosEnable => CosEnable,
        CosFreq => CosFreq
    );

U2 : Multiplier
    port map (
        IN1 => SIN1,
        IN2 => COS1,
        IN3 => SAW1,
        clk => clk,
        out1 => OUTPUT
    );

U3 : SawGenerator
    port map (
        CLK => clk,
        SAW1 => SAW1,
        SawEnable => SawEnable,
        SawFreq => SawFreq
    );

end;
