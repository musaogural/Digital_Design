library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_decimal is
port (	enable : in  STD_LOGIC;
			updown : in  STD_LOGIC;
			reset : in  STD_LOGIC;
			clk	: in STD_LOGIC;
			segment1 : out  STD_LOGIC_VECTOR (6 downto 0);
			segment10 : out  STD_LOGIC_VECTOR (6 downto 0) );
end counter_decimal;

architecture Behavioral of counter_decimal is

	component clk_div 
		 Port ( clk_50 : in  STD_LOGIC;
				  reset: in std_logic;
				  clk_out : out  STD_LOGIC
				  );
	end component;

	component counter
		 Port ( 	enable : in  STD_LOGIC;
					updown : in  STD_LOGIC;
					reset : in  STD_LOGIC;
					clk	: in STD_LOGIC;
					bcd1 : out  STD_LOGIC_VECTOR (3 downto 0);
					bcd10 : out  STD_LOGIC_VECTOR (3 downto 0)
				  );
	end component;

	component decoder7segment
	port (	bcd : in std_logic_vector(3 downto 0);  
				segment7 : out std_logic_vector(6 downto 0) );
	end component;
	
	signal ara1,ara10:std_logic_vector(3 downto 0);
	signal clk_ara:std_logic;

begin

	inst_clk_div: clk_div 
		Port map (
			clk_50=>clk,
			reset=>reset,
			clk_out=>clk_ara
		);

	inst_counter: counter
		Port map(
			enable=>enable,
			updown=>updown,
			reset=>reset,
			clk=>clk_ara,
			bcd1=>ara1,
			bcd10=>ara10
		);

	inst_decoder1: decoder7segment
		port map (
			bcd=>ara1,
			segment7=>segment10
		);
		
	inst_decoder10: decoder7segment
		port map (
			bcd=>ara10,
			segment7=>segment1
		);

end Behavioral;