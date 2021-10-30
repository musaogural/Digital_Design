library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg is
    Port ( rw : in  STD_LOGIC;
           da : in  STD_LOGIC_VECTOR (2 downto 0);
           aa : in  STD_LOGIC_VECTOR (2 downto 0);
           ba : in  STD_LOGIC_VECTOR (2 downto 0);
           D_data : in STD_LOGIC_VECTOR (15 downto 0);
           A_data : out STD_LOGIC_VECTOR (15 downto 0);
           B_data : out STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC);
end reg;

architecture behavior of reg is

type reg_type is array (7 downto 0) of std_logic_vector (15 downto 0);
signal reg8x16: reg_type;

begin

process (clk)
begin
   if (rising_edge(clk)) then
		if (rw = '1') then
			reg8x16(conv_integer(da)) <= D_data;
		end if;
   end if;
end process;

A_data <= reg8x16(conv_integer(aa));
B_data <= reg8x16(conv_integer(ba));

end behavior;

