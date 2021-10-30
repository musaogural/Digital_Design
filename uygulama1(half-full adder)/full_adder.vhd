library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is 
port (a, b, cin : in std_logic;
      s, cout :out std_logic);
end full_adder;

architecture behavior of full_adder is

	component half_adder
	port (a, b : in std_logic;
			s, c :out std_logic);
	end component;
	
	signal ara1,ara2,ara3:std_logic;
	
begin

ha1:half_adder port map(
a=>cin,
b=>ara1,
c=>ara3,
s=>s);

ha2:half_adder port map(
a=>a,
b=>b,
c=>ara2,
s=>ara1);

cout<=ara2 or ara3;

end behavior;