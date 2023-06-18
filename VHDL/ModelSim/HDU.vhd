LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY HDU IS
   PORT( 	
	PCwritedisable 		: OUT 	STD_LOGIC;
	IF_IDwritedisable   : OUT 	STD_LOGIC;
	Instruction			: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
	r1_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0); -- 20-16
	r2_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0); -- 15-11
	rd_EX_MEM		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
	rd_MEM_WB		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);	
	stall				: OUT   STD_LOGIC;
	Jump_ID_EX		    : IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
	Jump_EX_MEM		    : IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
	Jump_MEM_WB		    : IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);	
	RegWrite_ID_EX		: IN 	STD_LOGIC;
	RegWrite_EX_MEM		: IN 	STD_LOGIC;
	RegWrite_MEM_WB		: IN 	STD_LOGIC;
	RegDst 		    	: IN 	STD_LOGIC;
	MemRead_ID_EX_Reg	: IN 	STD_LOGIC);

END HDU;

ARCHITECTURE comb_hdu OF HDU IS

	signal R_type,I_type, B_type, J_type, to_stall,lw_stall,used_RA,used_RB,Branch_stall, JR_stall: STD_LOGIC;
	signal RA,RB: STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal OP: STD_LOGIC_VECTOR(5 DOWNTO 0);
	signal rd_ID_EX  : STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	
	begin
	
		OP <= Instruction(31 downto 26);
		R_type <= '1' when OP = "000000" or OP = "011100"  else '0'; --include mul
		B_type <= '1' when OP(5 downto 1) = "00010"  else '0';
		J_type <= '1' when (R_type = '1' AND Instruction(5 downto 0) = "001000") else '0';
		I_type <= '1' when R_type = '0' and B_type = '0' else '0';	
		
		RA <= 	Instruction(25 downto 21);		
		RB <= 	Instruction(20 downto 16) WHEN R_type = '1' ELSE
		Instruction(20 downto 16) WHEN B_type = '1' ELSE
		"00000";
		
		rd_ID_EX   <= r2_ID_EX WHEN RegDst = '1' ELSE r1_ID_EX;
		
			
		lw_stall   <= '1' WHEN MemRead_ID_EX_Reg = '1' AND ( r1_ID_EX = RA or r1_ID_EX = RB) ELSE		 
					  '0';
						
		used_RA    <=  '1' WHEN (RA = rd_ID_EX AND rd_ID_EX /="00000" AND RegWrite_ID_EX = '1') OR 
								(RA = rd_EX_MEM AND rd_EX_MEM /="00000" AND RegWrite_EX_MEM = '1') OR 
		                        (RA = rd_MEM_WB AND rd_MEM_WB /="00000"  AND RegWrite_MEM_WB = '1') 
								ELSE '0';
								
		used_RB    <=  '1' WHEN (RB = rd_ID_EX AND rd_ID_EX /="00000" AND RegWrite_ID_EX = '1') OR 
								(RB = rd_EX_MEM AND rd_EX_MEM /="00000" AND RegWrite_EX_MEM = '1') OR 
		                        (RB = rd_MEM_WB AND rd_MEM_WB /="00000"  AND RegWrite_MEM_WB = '1') ELSE '0';
								
						
		Branch_stall <= '1' WHEN B_type = '1' AND (Used_RA = '1' OR used_RB = '1') ELSE '0';
		
		
		JR_stall     <=  '1' WHEN J_type = '1' AND (Jump_ID_EX = "10" OR Jump_EX_MEM = "10" OR Jump_MEM_WB = "10" OR used_RA = '1') ELSE '0';
		
		
		to_stall   <= '1' WHEN lw_stall = '1' OR Branch_stall = '1' OR JR_stall ='1'  ELSE
					  '0';
						  
		PCwritedisable <= to_stall ;
		IF_IDwritedisable <= to_stall ;
		stall <= to_stall;
		
		
END comb_hdu;