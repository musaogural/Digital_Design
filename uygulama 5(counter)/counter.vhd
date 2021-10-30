
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter is
    Port ( 	enable : in  STD_LOGIC;
				updown : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				clk	: in STD_LOGIC;
				bcd1 : out  STD_LOGIC_VECTOR (3 downto 0);
				bcd10 : out  STD_LOGIC_VECTOR (3 downto 0)
           );
end counter;

architecture Behavioral of counter is
	signal count:std_logic_vector(6 downto 0):="0000000";
begin
	
	process(clk,reset)
	begin
		if (reset='1') then
			count<="0000000";
		elsif(rising_edge(clk)) then
			if(enable='1')then
				if(updown='1')then
					count<=count+"0000001";
				else
					count<=count-"0000001";
				end if;
			end if;
		end if;	
	end process;

	bcd1<=conv_std_logic_vector((conv_integer(count)/10),4);
	bcd10<=conv_std_logic_vector((conv_integer(count) mod 10),4);

end Behavioral;

