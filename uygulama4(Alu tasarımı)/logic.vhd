library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic is
 
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
CL : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC_VECTOR (1 downto 0));

end logic;

architecture Behavioral of logic is

begin 

WITH s SELECT

CL <= A and B WHEN "00",
		A or B WHEN "01",
		A xor B WHEN "10",
		not(A) WHEN "11",
	  "0000" WHEN OTHERS;

end Behavioral;