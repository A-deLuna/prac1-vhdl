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
  signal c: unsigned (4 downto 0);
  signal d: unsigned (7 downto 0);
  signal e: unsigned (7 downto 0);
  signal f: unsigned (7 downto 0);
  signal g: unsigned (7 downto 0);
  signal n: std_logic;
begin
  -- complemento 2 si R = 1
  c <= ('0'&(B xor (3 downto 0 => R)) + ('0' & R));
  -- suma
  d <= ("0000" & A) + ("000" & c);

  -- es negativo?
  n <= (R and (not d(4)));
  neg <= n;
  -- si es mayor o igual a 10 sumarle 6 si no fue resta
  e <= d + ("00000110" and (7 downto 0 => ((not R) and (d(4) or (d(3) and (d(2) or (d(1))))))));

  -- si es resta ignorar el bit de carry
  f <= e xor ("00010000" and (7 downto 0 => (R and not n)));

  --si es negativo complemento 2
  g <= (f xor "0000"&(3 downto 0 => n)) + ('0' & n); 

  S(7 downto 0) <= g;
end behavior_bcdAS;
