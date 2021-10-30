
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- logic and computer design fundamentals 4th ed. 
-- table 5 @ page:526

entity func_unit is
    Port ( a_in : in  STD_LOGIC_VECTOR (15 downto 0);
           b_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           fs : in  STD_LOGIC_VECTOR (4 downto 0));
end func_unit;

architecture Behavioral of func_unit is

begin


process (fs,a_in,b_in)
begin
   case fs is									
      when "00000" => data_out <= a_in;		
      when "00001" => data_out <= a_in+x"0001";  	
		when "00010" => data_out <= a_in+b_in;
		when "00011" => data_out <= a_in+b_in+x"0001";	
		when "00100" => data_out <= a_in + not(b_in);	
      when "00101" => data_out <= a_in + not(b_in)+x"0001";	
		when "00110" => data_out <= a_in-x"0001";			
		when "00111" => data_out <= a_in ;	
		
		when "01000" => data_out <= a_in and b_in;		
      when "01010" => data_out <= a_in or b_in;  	
		when "01100" => data_out <= a_in xor b_in;
		when "01110" => data_out <= not a_in;	
		
		when "10000" => data_out <= '0'&a_in(15 downto 1);	--shift right
		when "10001" => data_out <= b_in(14 downto 0)&'0';	--shift left
		
      when others => data_out <= "ZZZZZZZZZZZZZZZZ";
   end case;
end process;


end Behavioral;
