library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_adder_subs is
  port
  (
    A, B : in unsigned (3 downto 0);
    R: in std_logic;
    S : out unsigned (7 downto 0);
    neg: out std_logic
  );
end bcd_adder_subs;

architecture behavior_bcdAS of bcd_adder_subs is
  signal c: unsigned (3 downto 0);
  signal d: unsigned (7 downto 0);
  signal e: unsigned (7 downto 0);
  signal f: unsigned (7 downto 0);
begin
  -- complemento 2 si R = 1
  c <= (B xor (3 downto 0 => R)) + ('0' & R);
  -- suma
  d <= ("0000" & A) + ("0000" & c);

  -- es negativo?
  neg <= (R and (not d(4)));
  -- si es mayor o igual a 10 sumarle 6
  e <= d + ("00000110" and (7 downto 0 => (d(4) or (d(3) and (d(2) or (d(1)))))));
  S(7 downto 0) <= e;
end behavior_bcdAS;
