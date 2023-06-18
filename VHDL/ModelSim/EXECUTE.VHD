--  Execute module (implements the data ALU and Branch Address Adder  
--  for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.SIGNED;
USE ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



ENTITY  Execute IS
	PORT(	Read_data_1 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Function_opcode : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			Ainput_out      : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Binput_out      : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALUSrc 			: IN 	STD_LOGIC;
			FA,FB 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			ALUOp        	: IN 	STD_LOGIC_VECTOR( 2 DOWNTO 0 );
			ALU_Result 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Result_EX_MEM 	: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Result_MEM_WB 	: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			Read_data_2_ex 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 ); 
			
			-------------------ADDED----------------------------
			WReg_addr       : OUT	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Jump 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			RegDst 			: IN 	STD_LOGIC;
			Instruction_20_16       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Instruction_15_11       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Shamt       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			
			----------------------------------------------------
			clock, reset	: IN 	STD_LOGIC );
END Execute;

ARCHITECTURE behavior OF Execute IS
SIGNAL Ainput, Binput		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL ALU_output_mux		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL SUB_B		        : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL Branch_Add 			: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
SIGNAL ALU_ctl  			   : STD_LOGIC_VECTOR( 3 DOWNTO 0 );



BEGIN
						-- ALU input mux
	Ainput <= Result_EX_MEM WHEN FA = "10" ELSE
			  Result_MEM_WB WHEN FA = "01" ELSE
			  Read_data_1;
			  
	SUB_B  <= Result_EX_MEM WHEN FB = "10" ELSE
			  Result_MEM_WB WHEN FB = "01" ELSE
			  Read_data_2;	  
	
	Binput <= Sign_extend WHEN ( ALUSrc = '1') ELSE  
			  SUB_B;
			  
	Read_data_2_ex <= Result_EX_MEM WHEN FB = "10" ELSE
		   Result_MEM_WB WHEN FB = "01" ELSE
		   Read_data_2;
			  
	Ainput_out <= Ainput;
	Binput_out <= Binput;

 
						-- Select ALU output        
	ALU_result <= X"0000000" & B"000"  & ALU_output_mux( 31 ) WHEN  ALU_ctl = "0111" ELSE
				  ALU_output_mux( 31 DOWNTO 0 );
	
	
	-------------------ADDED---------------------------------------------------------
	WReg_addr   <= Instruction_15_11 WHEN RegDst = '1' ELSE
							 "11111" WHEN Jump = "10" ELSE   -- Jal
							 Instruction_20_16;
							 
	----------------------------------------------------------------------------------
	
							-- Generate ALU control bits

	ALU_ctl <=  "0000" when (ALUOp = "000" AND Function_opcode = "100100") OR (ALUOp = "001") else  -- and
			    "0001" when (ALUOp = "000" AND Function_opcode = "100101") OR (ALUOp = "010")  else  -- or
				"0011" when (ALUOp = "000" AND Function_opcode = "100110") OR (ALUOp = "011") else  -- xor
				"0100" when (ALUOp = "100") else                  -- mul
				"0101" when (ALUOp = "000" AND Function_opcode = "000000") else                  -- sll
				"0110" when (ALUOp = "000" AND Function_opcode = "100010") OR (ALUOp = "110")  else                  -- sub
				"0111" when (ALUOp = "000" AND Function_opcode = "101010") OR (ALUOp = "101") else                  -- slt
				"1000" when (ALUOp = "000" AND Function_opcode = "000010") else                  --srl
				"0010"; --add

PROCESS ( ALU_ctl, Ainput, Binput, Shamt )
	variable mul   : STD_LOGIC_VECTOR( 63 DOWNTO 0 );
	BEGIN
	mul := std_logic_vector(ieee.numeric_std.SIGNED(Ainput) * ieee.numeric_std.SIGNED(Binput));
					-- Select ALU operation
 	CASE ALU_ctl IS
						-- ALU performs ALUresult = A_input AND B_input
		WHEN "0000" 	=>	ALU_output_mux 	<= Ainput AND Binput; 
						-- ALU performs ALUresult = A_input OR B_input
     	WHEN "0001" 	=>	ALU_output_mux 	<= Ainput OR Binput;
						-- ALU performs ALUresult = A_input + B_input
	 	WHEN "0010" 	=>	ALU_output_mux 	<= Ainput + Binput;
						-- ALU performs ALUresult = A_input XOR B_input
 	 	WHEN "0011" 	=>	ALU_output_mux  <= Ainput XOR Binput;
						-- ALU performs ALUresult = A_input * B_input (without overflow)
 	 	WHEN "0100" 	=>	ALU_output_mux  <= mul(31 downto 0);
						-- ALU performs sll
 	 	WHEN "0101" 	=>	ALU_output_mux 	<=  std_logic_vector(shift_left(unsigned(Binput) ,to_integer(unsigned(Shamt))));
						-- ALU performs ALUresult = A_input -B_input
 	 	WHEN "0110" 	=>	ALU_output_mux 	<= Ainput - Binput;
						-- ALU performs SLT
  	 	WHEN "0111" 	=>	ALU_output_mux 	<= Ainput - Binput ;
						-- ALU performs srl
 	 	WHEN "1000" 	=>	ALU_output_mux 	<=  std_logic_vector(shift_right(unsigned(Ainput) ,to_integer(unsigned(Shamt))));
						-- ALU performs lui
  	 	WHEN "1001" 	=>	ALU_output_mux 	<= Binput( 15 DOWNTO 0 ) & X"0000" ;		
 	 	WHEN OTHERS	=>	ALU_output_mux 	<= X"00000000" ;
  	END CASE;
  END PROCESS;
END behavior;

--Ainput((31-CONV_INTEGER(Binput)) downto 0) & Zero_sig((CONV_INTEGER(Binput) -1) downto 0);

--variable mul   : STD_LOGIC_VECTOR( 63 DOWNTO 0 );
--mul := std_logic_vector(ieee.numeric_std.SIGNED(Ainput) * ieee.numeric_std.SIGNED(Binput));
--ALU_output_mux         <= mul(31 downto 0);
--std_logic_vector(shift_left(unsigned(Binput) ,to_integer(unsigned(Shamt))));
--std_logic_vector(shift_right(unsigned(Ainput) ,to_integer(unsigned(Shamt))));
--use ieee.numeric_std.SIGNED;
--use ieee.numeric_std.all;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;