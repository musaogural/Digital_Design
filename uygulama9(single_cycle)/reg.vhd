library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-----------------------------------------------
--16 bitlik 8 registerden oluşan register file 
--clk'dan bağımsız RAM yapısındadır.
-----------------------------------------------

entity reg is
    Port ( rw : in  STD_LOGIC;									--rw=1 için yazar 
           da : in  STD_LOGIC_VECTOR (2 downto 0);			--yazma adersi
           aa : in  STD_LOGIC_VECTOR (2 downto 0);			--a kanalı okuma adresi
           ba : in  STD_LOGIC_VECTOR (2 downto 0);			--b kanalı okuma adresi
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);	--yazma kanalı data girişi
           a_out : out  STD_LOGIC_VECTOR (15 downto 0);	--a kanalı okunana data
           b_out : out  STD_LOGIC_VECTOR (15 downto 0);  --b kanalı okunana data
			  clk		: in std_LOGIC);	
end reg;

architecture Behavioral of reg is

	type reg_type is array (7 downto 0) of std_logic_vector (15 downto 0);
	
	signal reg8x16: reg_type:=(	x"0031",				--r7 49 decimal
											x"0024",				--r6 36
											x"0019",				--r5 25
											x"0010",				--r4 16
											x"0009",				--r3 9
											x"0004",				--r2 4
											x"0001",				--r1 1
											x"0000");			--r0 0			

begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			if (rw = '1') then
				reg8x16(conv_integer(da)) <= data_in;
			end if;
		end if;		
	end process;
	
	a_out <= reg8x16(conv_integer(aa));
	b_out <= reg8x16(conv_integer(ba));


end Behavioral;