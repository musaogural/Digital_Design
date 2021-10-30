library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
	port (
			rw         :in std_logic;
			clk        :in std_logic;
			da,aa,ba   :in std_logic_vector(2 downto 0);
			data_in    :in std_logic_vector(15 downto 0);
			constant_in:in std_logic_vector(15 downto 0);
			fs         :in std_logic_vector(3 downto 0);
			mb, md     :in std_logic;
			V,C,N,Z    :out std_logic
			);
			
end datapath;

architecture behavior of datapath is

	component func_unit
	port (
			A:in std_logic_vector(15 downto 0);
			B:in std_logic_vector(15 downto 0);
			F:out std_logic_vector(15 downto 0);
			FS:in std_logic_vector(3 downto 0);
			V,C,N,Z:out std_logic
			);
	end component;
	
	component reg
	port (
			  rw : in  STD_LOGIC;
           da : in  STD_LOGIC_VECTOR (2 downto 0);
           aa : in  STD_LOGIC_VECTOR (2 downto 0);
           ba : in  STD_LOGIC_VECTOR (2 downto 0);
           D_data : in STD_LOGIC_VECTOR (15 downto 0);
           A_data : out STD_LOGIC_VECTOR (15 downto 0);
           B_data : out STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC
			  );
	end component;
	
	component mux2to1_16bit
	port (
			in0 : in STD_LOGIC_VECTOR (15 downto 0);
			in1 : in STD_LOGIC_VECTOR (15 downto 0);
			s   : in STD_LOGIC;
			out_m : out STD_LOGIC_VECTOR (15 downto 0)
			);
	end component;
	
	signal a_bus_ara: std_LOGIC_VECTOR (15 downto 0);
	signal b_bus_ara1, b_bus_ara2: std_LOGIC_VECTOR (15 downto 0);
	signal f_bus_ara1, f_bus_ara2: std_LOGIC_VECTOR (15 downto 0);

begin
	
datapath_func_unit: func_unit port map
	( 
	  A   => a_bus_ara,
	  B   => b_bus_ara2,
	  F   => f_bus_ara1,
	  FS  => fs,
	  V   => V,
	  C   => C,
	  N   => N,
	  Z   => Z
	 );
	 
datapath_reg: reg port map
	( 
	  da    => da,
	  aa    => aa,
	  ba    => ba,
	  rw    => rw,
	  clk   => clk,
	  A_data=> a_bus_ara,
	  B_data=> b_bus_ara1,
	  D_data=> f_bus_ara2
	 );

datapath_mux1: mux2to1_16bit port map
	( 
	  in0    => b_bus_ara1,
	  in1    => constant_in,
	  s      => mb,
	  out_m  => b_bus_ara2
	 );
	 
datapath_mux2: mux2to1_16bit port map
	( 
	  in0    => f_bus_ara1,
	  in1    => data_in,
	  s      => md,
	  out_m  => f_bus_ara2
	 );
	

end behavior;
