library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity func_unit is
	port (
			A:in std_logic_vector(15 downto 0);
			B:in std_logic_vector(15 downto 0);
			F:out std_logic_vector(15 downto 0);
			FS:in std_logic_vector(3 downto 0);
			V,C,N,Z:out std_logic	
			);
			
end func_unit;

architecture behavior of func_unit is
	signal buffer_value:std_logic_vector (16 downto 0);

begin

process (A,B,FS)
begin
	case FS is --operators
		when "0000" => buffer_value <='0'&A;
		when "0001" => buffer_value <= ('0'&A)+1;
		when "0010" => buffer_value <= ('0'&A)+('0'&B);
		when "0011" => buffer_value <= ('0'&A)+('0'&B)+1;
		when "0100" => buffer_value <= ('0'&A)+not(('0'&B));
      when "0101" => buffer_value <= ('0'&A)+not(('0'&B))+1;
		when "0110" => buffer_value <= ('0'&A)-1;
		when "0111" => buffer_value <= ('0'&A);
		when "1000" => buffer_value <= '0'&(A and B);
      when "1001" => buffer_value <= '0'&(A or B);
		when "1010" => buffer_value <= '0'&(A xor B);
		when "1011" => buffer_value <= '0'& not(A);
		when "1100" => buffer_value <= '0'&B;
      when "1101" => buffer_value <= '0'&('0'&B(15 downto 1));--srB
		when "1110" => buffer_value <= '0'&(B(14 downto 0)&'0');--rlB
      when others => buffer_value <= "XXXXXXXXXXXXXXXXX";

	end case;
end process;

process (A,B,FS)
begin
	if(buffer_value(15 downto 0)="0000000000000000") then
		Z<='1';
	else
		Z<='0';
	end if;
end process;

process (A,B,FS)
begin
	if(A(15)='1' and B(15)='1' and buffer_value(15)='0') then
		V<='1';
	elsif(A(15)='0' and B(15)='0' and buffer_value(15)='1') then
		V<='1';
	else
		V<='0';
	end if;
end process;

C<=buffer_value(16);
N<=buffer_value(15);

F<=buffer_value(15 downto 0);

end behavior;