library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_div is
    Port ( clk_50 : in  STD_LOGIC;			--50Mhz giriş clk
           reset: in std_logic; 				--reset
           clk_out : out  STD_LOGIC			--çıkış clk
           );
end clk_div;

architecture Behavioral of clk_div is
    signal control: std_logic:='0'; 		
    signal counter: integer range 0 to 25000000 :=0;     	
begin 
    
	process (clk_50,reset)											 
	begin 					
		if (reset='1') then
			counter <= 0;
			control <= '0';
		elsif (rising_edge(clk_50)) then
			if (counter=25000000)     then
				control <= not(control);
				counter <= 0;
			else
				counter <=counter + 1;
			end if;
		end if;
	end process;

clk_out <= control;

end Behavioral;
