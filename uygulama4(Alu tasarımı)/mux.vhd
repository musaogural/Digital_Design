library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
 
Port ( in0 : in STD_LOGIC_VECTOR (3 downto 0);
in1 : in STD_LOGIC_VECTOR (3 downto 0);
CM : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC);

end mux;

architecture Behavioral of mux is

begin

WITH s SELECT

CM <= in0 WHEN '0',
		  in1 WHEN '1',
	  "0000" WHEN OTHERS;

end Behavioral;