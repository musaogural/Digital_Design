library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2to1_16bit is
Port ( 
		in0 : in STD_LOGIC_VECTOR (15 downto 0);
		in1 : in STD_LOGIC_VECTOR (15 downto 0);
		s   : in STD_LOGIC;
		out_m : out STD_LOGIC_VECTOR (15 downto 0)
		);
end mux2to1_16bit;

architecture behavior of mux2to1_16bit is
begin
	process(in0,in1,s)
		begin
			case s is
				when '0'=>  out_m<=in0;
				when '1'=>  out_m<=in1;
				when others=> out_m<="XXXXXXXXXXXXXXXX";
			end case;
	end process;
end behavior; 