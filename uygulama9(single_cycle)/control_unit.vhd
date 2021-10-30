library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---------------------------------------------------
--control unit; 
--single cycle içinde clk gerektiren tek birimdir.
--
--pc sayıcı ve roma bağlı olarak,
--
--da, aa, ba adreslerini 
--mb, md, fs seçimini
--rw, mw  kontrolünü  düzenler.
--
--zero fill çıkışını yani constant in girişini belirler.
---------------------------------------------------

entity control_unit is
port(
			clk : in  STD_LOGIC;
			zerofill_out: out std_logic_vector(15 downto 0);
			da_out, ba_out, aa_out	: out std_logic_vector(2 downto 0);
			mb_out, md_out, rw_out  : out std_logic;
			fs_out: out std_logic_vector(4 downto 0)
);
end control_unit;  

architecture Behavioral of control_unit is


	signal count : std_logic_vector(2 downto 0):="000";

--rom tanımlama	
	type rom_type is array (0 to 15) of std_logic_vector (15 downto 0);
	-- yapılacak işlemlerin kodlarını yazınız:
signal rom : rom_type :=(	
							"0010001000100000",				--0.işlem  r0<=sl r4
							"0010001001101000",				--1.işlem  r1<=sl r5
							"0000101010001000",				--2.işlem  r2<=r1-r0
							"0010000011010000",				--3.işlem  r3<=sr r2
							"1000010000000101",				--4.işlem  r0<=r0+5
							"0010001001110000",				--5.işlem  r1<=sl r6
							"0001110010000000",				--6.işlem  r2<=not r0
							"0001000011010001",				--7.işlem  r3<=r2 and r1
							"0001000011010001",				--8.işlem  r3<=r2 and r1
							"0001000011010001",				--9.işlem  r3<=r2 and r1
							"0001000011010001",				--10.işlem  r3<=r2 and r1
							others => "1111111111111111"	);			
	
	signal instruction : std_logic_vector(15 downto 0);

begin

	--program counter işlemleri
	pc:process (clk) 
		begin
			if rising_edge(clk) then
				count <= count + "001";
			end if;
		end process;
		
	--rom işlemleri
		instruction<=rom(conv_integer(count));
		
	--decoder işlemleri
		da_out<=instruction(8 downto 6);
		ba_out<=instruction(2 downto 0);
		aa_out<=instruction(5 downto 3);
		mb_out<=instruction(15);
		fs_out<=instruction(13 downto 9);
		md_out<=instruction(14);
		rw_out<= instruction(13) or (not(instruction(14)));
		
	--zerofill işlemi
		zerofill_out<="0000000000000"&instruction(2 downto 0);
		
	
end Behavioral;