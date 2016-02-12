library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_tb is
end bcd_tb;

architecture beh of bcd_tb is
  component bcd_adder_subs
    port(
      A, B: in unsigned(3 downto 0);
      R : in std_logic;
      S: out unsigned(7 downto 0);
      neg: out std_logic
    );
  end component;
  signal A, B : unsigned(3 downto 0);
  signal R: std_logic;
  signal S: unsigned(7 downto 0);
  signal neg: std_logic;
begin
  u0: bcd_adder_subs port map (A, B, R, S, neg);
  A <= "1001" after 0 ns, "0110" after 10 ns, "0001" after 20 ns, "0000" after 30 ns;
  B <= "1001" after 0 ns, "0000" after 30 ns;
  R <= '0' after 0 ns, '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns;
end beh;
