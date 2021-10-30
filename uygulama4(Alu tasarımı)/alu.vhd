library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC_VECTOR (2 downto 0);
cin: in STD_LOGIC;
CALU : out STD_LOGIC_VECTOR (3 downto 0)
		);
end alu;

architecture behavior of alu is

component mux
Port ( 
in0 : in STD_LOGIC_VECTOR (3 downto 0);
in1 : in STD_LOGIC_VECTOR (3 downto 0);
CM : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC);
end component;

component arithmetic
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
CA : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC_VECTOR (1 downto 0);
cin: in STD_LOGIC);
end component;

component logic
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
CL : out STD_LOGIC_VECTOR (3 downto 0);
s : in STD_LOGIC_VECTOR (1 downto 0));
end component;

signal ara1,ara2:std_LOGIC_VECTOR (3 downto 0);

begin
logic_unit:logic port map(
s(0)=>cin,
s(1)=>s(0),
A=>A,
B=>B,
CL=>ara1
);

arithmetic_unit:arithmetic port map(
cin=>cin,
s(0)=>s(0),
s(1)=>s(1),
A=>A,
B=>B,
CA=>ara2
);

mux_unit:mux port map(
s=>s(2),
in0=>ara2,
in1=>ara1,
CM=>CALU
);
  
end behavior;


