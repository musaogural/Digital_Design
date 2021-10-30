library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic is
 
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
CA : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC_VECTOR (1 downto 0);
cin: in STD_LOGIC);

end arithmetic;

architecture Behavioral of arithmetic is
signal switch: std_LOGIC_VECTOR(2 downto 0);

begin
switch<= s & cin;

WITH switch SELECT

CA <= A WHEN "000",
		  A+1 WHEN "001",
		  A+B WHEN "010",
		  A+B+1 WHEN "011",
		  A+not(B) WHEN "100",
		  A+not(B)+1 WHEN "101",
		  A-1 WHEN "110",
		  A WHEN "111",
	  "0000" WHEN OTHERS;

end Behavioral;