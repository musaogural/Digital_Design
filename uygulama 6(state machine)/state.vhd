library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity state is
port(
	start:in std_logic;
	s0,s1:in std_logic;
	c_out:out std_logic_vector(3 downto 0);
	T:out std_logic_vector(3 downto 0);
	K:in std_logic_vector(3 downto 0);
	led1,led2,led3:out std_logic;
	clk,reset:in std_logic
);
end state;

architecture beh of state is

signal Ax,Bx :std_logic_vector(3 downto 0):="0000";

type typ_state is (A,B,C,D,E);
signal state,next_state:typ_state;

begin

process(clk,reset)
begin
	if(reset='1')then
		state<=A;
	elsif(rising_edge(clk))then
		state<=next_state;
	end if;
end process;

process(state,s0,s1)
begin
	case state is
		when A=>
		
		if s0='1' then
			next_state<=B;
		else
			next_state<=A;
		end if;
		
		when B=>
		
		if s1='1' then
			next_state<=D;
		else
			next_state<=C;
		end if;
		
		when C=>

		if s1 & s0="00" then
			next_state<=E;
		else
			next_state<=C;
		end if;
		
		when D=>
		
		if s1='1' then
			next_state<=E;
		else
			next_state<=C;
		end if;	
		
		when E=>
			next_state<=A;
			
	end case;
end process;

process(state,K)
begin
	case state is
		when A=>
		led1<='0';
		led2<='1';
		led3<='0';
		when B=>
		led1<='1';
		led2<='0';
		led3<='0';
		Ax<="1010";
		Bx<="1011";
		when C=>
		led1<='1';
		led2<='1';
		led3<='0';
		C_out<=Ax-Bx;
		when D=>
		led1<='0';
		led2<='0';
		led3<='0';
		Ax<=Ax+"0001";
		when E=>
		led1<='0';
		led2<='0';
		led3<='1';
		Bx<=Bx-"0001";
		T<=K;
	end case;
end process;


end beh;

