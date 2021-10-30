library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_8x8 is
	port (rw:in std_logic;
			da:in std_logic_vector(2 downto 0);
			aa:in std_logic_vector(2 downto 0);
			ba:in std_logic_vector(2 downto 0);
			data_in:in std_logic_vector(7 downto 0);
			a_out:out std_logic_vector(7 downto 0);
			b_out:out std_logic_vector(7 downto 0);
			clk:in std_logic
			);
			
end reg_8x8;

architecture behavior of reg_8x8 is

type ram_type is array (7 downto 0) of std_logic_vector (7 downto 0);
signal ram:ram_type:=("00000111","00000110","00000101","00000100","00000011","00000010","00000001","00000000");

begin
 
process(clk)
begin
	if (clk'event and clk='1') then
		if(rw='1') then
			ram(conv_integer(da))<=data_in;
		end if;
		a_out<=ram(conv_integer(aa));
		b_out<=ram(conv_integer(ba));
	end if;
end process;

end behavior;








