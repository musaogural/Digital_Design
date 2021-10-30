library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity state is
port(
	start:in std_logic;
	s0:in std_logic;
	bas1,bas2,bas3,bas4:out std_logic_vector(3 downto 0);
	clk,reset:in std_logic;
	K:in std_logic_vector(13 downto 0)
);
end state;

architecture behavior of state is

type typ_state is (A,B,C,D,E);
signal state,next_state:typ_state;

signal sayi:std_logic_vector(13 downto 0):="00000000000000";

begin

process(clk,reset)
begin
	if(reset='1')then
		state<=A;
	elsif(rising_edge(clk))then
		state<=next_state;
	end if;
end process;

process(s0,state)
begin
	case state is
		when A=>
		
		if s0='1' then
			next_state<=B;
		else
			next_state<=A;
		end if;
		
		when B=>
			next_state<=C;
		when C=>
			next_state<=D;
		when D=>
			next_state<=E;
		when E=>
			next_state<=A;
	end case;
end process;


process(state,K)
begin
	case state is
		when A=>
			sayi<=K;
		when B=>
			bas1<=conv_std_logic_vector((conv_integer(sayi) mod 10),4);
		when C=>
			bas2<=conv_std_logic_vector(((conv_integer(sayi) mod 100)/10),4);
		when D=>
			bas3<=conv_std_logic_vector(((conv_integer(sayi) mod 1000)/100),4);	
		when E=>
			bas4<=conv_std_logic_vector((conv_integer(sayi)/1000),4);
	end case;
end process;


end behavior;


