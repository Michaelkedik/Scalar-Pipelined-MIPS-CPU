-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MIPS IS

	PORT( reset, clock					: IN 	STD_LOGIC; 
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out					: OUT 	STD_LOGIC );
END 	MIPS;

ARCHITECTURE structure OF MIPS IS

	COMPONENT Ifetch IS
		PORT(	SIGNAL Instruction 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				SIGNAL PC_plus_4_out 	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				SIGNAL Add_result 		: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				SIGNAL read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				SIGNAL J_addr          	: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				SIGNAL Branch          	: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
				SIGNAL Jump 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
				SIGNAL Zero 			: IN 	STD_LOGIC;
				SIGNAL PCwritedisable 	: IN 	STD_LOGIC;
				SIGNAL PC_out 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				SIGNAL IF_Flush			: OUT 	STD_LOGIC;
				SIGNAL clock, reset 	: IN 	STD_LOGIC);
	END COMPONENT;

	COMPONENT Idecode IS
		  PORT(	read_data_1_out	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				read_data_2_out	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Instruction : IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				read_data 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				ALU_result	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				RegWrite 	: IN 	STD_LOGIC;
				MemtoReg 	: IN 	STD_LOGIC;
				Jump 		: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
				Shift 		: IN 	STD_LOGIC;
				PC_plus_4_jal 	: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				PC_plus_4 	: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				Sign_extend_out : OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				
				---------------------------ADDED-------------------------------------------------------
				Instruction_20_16 : OUT 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Instruction_15_11 : OUT 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Instruction_10_6  : OUT 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				WReg_addr         : IN  	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Add_result        : OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				Zero			  : OUT   	STD_LOGIC;
				J_addr            : OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				---------------------------------------------------------------------------------------
				
				clock,reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT control IS
	   PORT( 	
		Opcode 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
		Function_opcode 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
		RegDst 		: OUT 	STD_LOGIC;
		ALUSrc 		: OUT 	STD_LOGIC;
		MemtoReg 	: OUT 	STD_LOGIC;
		RegWrite 	: OUT 	STD_LOGIC;
		MemRead 	: OUT 	STD_LOGIC;
		MemWrite 	: OUT 	STD_LOGIC;
		Shift 		: OUT 	STD_LOGIC;
		Jump 		: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		Branch 		: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		ALUop 		: OUT 	STD_LOGIC_VECTOR( 2 DOWNTO 0 );
		clock, reset	: IN 	STD_LOGIC );

	END COMPONENT;

	COMPONENT  Execute IS
		PORT(	Read_data_1 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Read_data_2 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Function_opcode : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
				ALUSrc 			: IN 	STD_LOGIC;
				FA,FB 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
				ALUOp        	: IN 	STD_LOGIC_VECTOR( 2 DOWNTO 0 );
				ALU_Result 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Result_EX_MEM 	: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				Result_MEM_WB 	: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				
				-------------------ADDED----------------------------
				WReg_addr       : OUT	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Jump 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
				RegDst 			: IN 	STD_LOGIC;
				Instruction_20_16       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Instruction_15_11       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Shamt       : IN	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
				Read_data_2_ex 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );  --*****************
				
				----------------------------------------------------
				clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT dmemory IS
	     PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		address 			: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        		write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		MemRead, Memwrite 	: IN 	STD_LOGIC;
        		Clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;
					
	COMPONENT FU IS
	   PORT( 	
		rs_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
		rt_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
		rd_EX_MEM		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
		rd_MEM_WB		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegWrite_EX_MEM		: IN 	STD_LOGIC;
		RegWrite_MEM_WB		: IN 	STD_LOGIC;
		FA, FB              : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)	
	);
	END COMPONENT;	

	COMPONENT HDU IS
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

	END COMPONENT;
	
					-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4 		  : STD_LOGIC_VECTOR( 9 DOWNTO 	0 );
	SIGNAL read_data_1 		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2 		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Sign_extend 		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result 		  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result 		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data 		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALUSrc 			  : STD_LOGIC;
	SIGNAL ALU_ctl 		  	  : STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL J_addr 			  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL RegDst 			  : STD_LOGIC;
	SIGNAL Regwrite 		  : STD_LOGIC;
	SIGNAL Zero 			  : STD_LOGIC;
	SIGNAL Jump 			  : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Branch 			  : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Shift 		      : STD_LOGIC;
	SIGNAL MemWrite 		  : STD_LOGIC;
	SIGNAL MemtoReg 		  : STD_LOGIC;
	SIGNAL MemRead 			  : STD_LOGIC;
	SIGNAL ALUop 			  : STD_LOGIC_VECTOR(  2 DOWNTO 0 );
	SIGNAL Instruction		  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL WReg_addr 		  : STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL Instruction_20_16  : STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL Instruction_15_11  : STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL Instruction_10_6   : STD_LOGIC_VECTOR(  4 DOWNTO 0 );
	SIGNAL PCwritedisable 	  : STD_LOGIC;
	SIGNAL IF_IDwritedisable  : STD_LOGIC;
	SIGNAL stall			  : STD_LOGIC;
	SIGNAL FA,FB 			  : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Result_MEM_WB      : STD_LOGIC_VECTOR(31 DOWNTO 0 );
	SIGNAL IF_Flush			  : STD_LOGIC;
	SIGNAL read_data_2_ex    : STD_LOGIC_VECTOR(31 DOWNTO 0 );
	
	
	--- Signals used for the pipeline ---------------------------------------
	
	------------------ IF/ID ----------------------------------------------
	------------------- DataPath ------------------------------------------
	SIGNAL Instruction_IF_ID_Reg		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL PC_plus_4_IF_ID_Reg 		    : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	
	------------------ ID/EX ----------------------------------------------
	------------------- DataPath ------------------------------------------
	SIGNAL Instruction_ID_EX_Reg		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL PC_plus_4_ID_EX_Reg 		    : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data_1_ID_EX_Reg 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2_ID_EX_Reg 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Sign_extend_ID_EX_Reg 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Instruction_20_16_ID_EX_Reg 	: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL Instruction_15_11_ID_EX_Reg 	: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL Instruction_10_6_ID_EX_Reg 	: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	------------------- Control -------------------------------------------
	SIGNAL RegDst_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL ALUSrc_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL MemtoReg_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL RegWrite_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL MemRead_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL MemWrite_ID_EX_Reg 			: STD_LOGIC;
	SIGNAL ALUop_ID_EX_Reg 		     	: STD_LOGIC_VECTOR( 2 DOWNTO 0 );
	SIGNAL Branch_ID_EX_Reg 			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Jump_ID_EX_Reg 			    : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	------------------ EX/MEM ----------------------------------------------
	------------------- DataPath ------------------------------------------
	SIGNAL Instruction_EX_MEM_Reg		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result_EX_MEM_Reg 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result_EX_MEM_Reg  		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2_EX_MEM_Reg 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL WReg_addr_EX_MEM_Reg 		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL J_addr_EX_MEM_Reg 	     	: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL PC_plus_4_EX_MEM_Reg		    : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	------------------- Control -------------------------------------------
	SIGNAL MemtoReg_EX_MEM_Reg 			: STD_LOGIC;
	SIGNAL RegWrite_EX_MEM_Reg 			: STD_LOGIC;
	SIGNAL MemRead_EX_MEM_Reg			: STD_LOGIC;
	SIGNAL MemWrite_EX_MEM_Reg			: STD_LOGIC;
	SIGNAL Zero_EX_MEM_Reg			    : STD_LOGIC;
	SIGNAL Branch_EX_MEM_Reg			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Jump_EX_MEM_Reg		     	: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	
	------------------ MEM/WB ----------------------------------------------
	------------------- DataPath ------------------------------------------
	SIGNAL Instruction_MEM_WB_Reg		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_MEM_WB_Reg 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALU_result_MEM_WB_Reg  		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL WReg_addr_MEM_WB_Reg 		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL PC_plus_4_MEM_WB_Reg 		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	-----------------------------------------------------------------------
	
	------------------- Control -------------------------------------------
	SIGNAL MemtoReg_MEM_WB_Reg 			: STD_LOGIC;
	SIGNAL RegWrite_MEM_WB_Reg 			: STD_LOGIC;	
	SIGNAL Jump_MEM_WB_Reg		     	: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	-----------------------------------------------------------------------

	

BEGIN
					-- copy important signals to output pins for easy 
					-- display in Simulator
   Instruction_out 	<= Instruction;
   ALU_result_out 	<= ALU_result;
   read_data_1_out 	<= read_data_1;
   read_data_2_out 	<= read_data_2;
   write_data_out  	<= read_data WHEN MemtoReg = '1'ELSE
					   "0000000000000000000000" & PC_plus_4 WHEN Jump = "00" ELSE
					   ALU_result;
  -- Branch_out 		<= Branch;
   Zero_out 		<= Zero;
   RegWrite_out 	<= RegWrite;
   MemWrite_out 	<= MemWrite;

	Result_MEM_WB <= ALU_result_MEM_WB_Reg WHEN MemtoReg_MEM_WB_Reg = '0' ELSE
			         read_data_MEM_WB_Reg;
					-- connect the 5 MIPS components   
	
	
  IFE : Ifetch
	PORT MAP (	Instruction 	=> Instruction,
    	    	PC_plus_4_out 	=> PC_plus_4,
				Add_result 		=> Add_result,
				read_data_1 	=> read_data_1,
				J_addr 		    => J_addr,
				Branch 		    => Branch,
				Jump 			=> Jump,
				Zero 			=> Zero,
				PCwritedisable  => PCwritedisable,
				PC_out 			=> PC,
				IF_Flush        => IF_Flush,
				clock 			=> clock,  
				reset 			=> reset );

   ID : Idecode
   	PORT MAP (	read_data_1_out => read_data_1,
        		read_data_2_out => read_data_2,
        		Instruction 	=> Instruction_IF_ID_Reg,
        		read_data 		=> read_data_MEM_WB_Reg,
				ALU_result 		=> ALU_result_MEM_WB_Reg,
				RegWrite 		=> RegWrite_MEM_WB_Reg,
				MemtoReg 		=> MemtoReg_MEM_WB_Reg,
				Jump 		    => Jump_MEM_WB_Reg,
				Shift           => Shift,
				PC_plus_4_jal 	=> PC_plus_4_MEM_WB_Reg,
				PC_plus_4       => PC_plus_4_IF_ID_Reg,
				Sign_extend_out => Sign_extend,
				
				---------------ADDED----------------------------
				Instruction_20_16 => Instruction_20_16,
				Instruction_15_11 => Instruction_15_11,
				Instruction_10_6  => Instruction_10_6,
				WReg_addr 		  => WReg_addr_MEM_WB_Reg,
				Add_Result        => Add_Result,
				Zero              => Zero,
				J_addr 		      => J_addr,
				------------------------------------------------
				
        		clock 			=> clock,  
				reset 			=> reset );

   CTL:   control
	PORT MAP ( 	Opcode 			=> Instruction_IF_ID_Reg( 31 DOWNTO 26 ),
				Function_opcode	=> Instruction_IF_ID_Reg( 5 DOWNTO 0 ),
				RegDst 			=> RegDst,
				ALUSrc 			=> ALUSrc,
				MemtoReg 		=> MemtoReg,
				RegWrite 		=> RegWrite,
				MemRead 		=> MemRead,
				Branch 		    => Branch,
				Jump            => Jump,
				Shift           => Shift,
				MemWrite 		=> MemWrite,
				ALUop 		    => ALUop,
                clock 			=> clock,
				reset 			=> reset );

   EXE:  Execute
   	PORT MAP (	Read_data_1 	=> read_data_1_ID_EX_Reg,
             	Read_data_2 	=> read_data_2_ID_EX_Reg,
				Sign_extend 	=> Sign_extend_ID_EX_Reg,
                Function_opcode	=> Instruction_ID_EX_Reg( 5 DOWNTO 0 ),
				ALUop           => ALUop_ID_EX_Reg,				
				ALUSrc 			=> ALUSrc_ID_EX_Reg,
				FA			    => FA,
				FB              => FB,
			    Result_EX_MEM   => ALU_result_EX_MEM_Reg,
			    Result_MEM_WB   => Result_MEM_WB,
                ALU_Result		=> ALU_Result,
				PC_plus_4		=> PC_plus_4_ID_EX_Reg,
				----- ADDED -------------------
				WReg_addr 		=> WReg_addr,
				Jump 		    => Jump_ID_EX_Reg,
				RegDst 		    => RegDst_ID_EX_Reg,
				Instruction_20_16 => Instruction_20_16_ID_EX_Reg,
				Instruction_15_11 => Instruction_15_11_ID_EX_Reg,
				Shamt => Instruction_10_6_ID_EX_Reg,
				read_data_2_ex => read_data_2_ex,
				----------------------------------
                Clock			=> clock,
				Reset			=> reset );

   MEM:  dmemory
	PORT MAP (	read_data 		=> read_data,
				address 		=> ALU_result_EX_MEM_Reg (9 DOWNTO 2),--jump memory address by 4
				write_data 		=> read_data_2_EX_MEM_Reg,
				MemRead 		=> MemRead_EX_MEM_Reg, 
				Memwrite 		=> MemWrite_EX_MEM_Reg, 
                clock 			=> clock,  
				reset 			=> reset );
					
	FORWARDING_UNIT: FU PORT MAP (
		rs_ID_EX		    => Instruction_ID_EX_Reg(25 downto 21),
		rt_ID_EX		    => Instruction_ID_EX_Reg(20 downto 16),
		rd_EX_MEM		    => WReg_addr_EX_MEM_Reg,
		rd_MEM_WB		    => WReg_addr_MEM_WB_Reg,
		RegWrite_EX_MEM		=> RegWrite_EX_MEM_Reg,
		RegWrite_MEM_WB		=> RegWrite_MEM_WB_Reg,
		FA                  => FA,
		FB                  => FB
	);
	
	HAZARD_DETECTION: HDU PORT MAP (
							PCwritedisable => PCwritedisable,
							IF_IDwritedisable => IF_IDwritedisable,
							Instruction => Instruction_IF_ID_Reg,
							r1_ID_EX => Instruction_20_16_ID_EX_Reg,
							r2_ID_EX => Instruction_15_11_ID_EX_Reg,
							rd_EX_MEM => WReg_addr_EX_MEM_Reg,
							rd_MEM_WB => WReg_addr_MEM_WB_Reg,
							Jump_ID_EX => Jump_ID_EX_Reg,
							Jump_EX_MEM => Jump_EX_MEM_Reg,
							Jump_MEM_WB => Jump_MEM_WB_Reg,
							stall => stall,
							RegWrite_ID_EX => RegWrite_ID_EX_Reg,
							RegWrite_EX_MEM => RegWrite_EX_MEM_Reg,
							RegWrite_MEM_WB => RegWrite_MEM_WB_Reg,
							RegDst => RegDst_ID_EX_Reg,
							MemRead_ID_EX_Reg => MemRead_ID_EX_Reg
	
	);
		
	Pipeline:
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' ); 
			
			---------------- ID/EX Register ------------------------
			------------------- DataPath ---------------------------
			PC_plus_4_ID_EX_Reg          <=  PC_plus_4_IF_ID_Reg;
			Instruction_ID_EX_Reg        <=  Instruction_IF_ID_Reg;
			read_data_1_ID_EX_Reg        <=  read_data_1;
			read_data_2_ID_EX_Reg        <=  read_data_2;
			Sign_extend_ID_EX_Reg        <=  Sign_extend;
			Instruction_20_16_ID_EX_Reg  <=  Instruction_20_16;
			Instruction_15_11_ID_EX_Reg  <=  Instruction_15_11;
			Instruction_10_6_ID_EX_Reg   <=  Instruction_10_6;
			--------------------------------------------------------
			
			------------------- Control ----------------------------
			IF stall /= '1' THEN  
				RegDst_ID_EX_Reg  			 <=  RegDst;
				ALUSrc_ID_EX_Reg  			 <=  ALUSrc;
				MemtoReg_ID_EX_Reg  		 <=  MemtoReg;
				ALUop_ID_EX_Reg  			 <=  ALUop;
				Branch_ID_EX_Reg  			 <=  Branch;
				Jump_ID_EX_Reg  			 <=  Jump;
				RegWrite_ID_EX_Reg           <= RegWrite;
				MemRead_ID_EX_Reg            <= MemRead;
				MemWrite_ID_EX_Reg           <= MemWrite;
			ELSE
      			RegDst_ID_EX_Reg  			 <=  '0';
				ALUSrc_ID_EX_Reg  			 <=  '0';
				MemtoReg_ID_EX_Reg  		 <=  '0';
				ALUop_ID_EX_Reg  			 <=  "000";
				Branch_ID_EX_Reg  			 <=  "00";
				Jump_ID_EX_Reg  			 <=  "00";
				RegWrite_ID_EX_Reg           <=  '0';
				MemRead_ID_EX_Reg            <=  '0';
				MemWrite_ID_EX_Reg           <=  '0';
			END IF;
			
			--------------------------------------------------------
			
			---------------- EX/MEM Register -----------------------
			------------------- DataPath ---------------------------
			PC_plus_4_EX_MEM_Reg         <=  PC_plus_4_ID_EX_Reg;
			Instruction_EX_MEM_Reg       <=  Instruction_ID_EX_Reg;
			Add_result_EX_MEM_Reg        <=  Add_result;
			ALU_result_EX_MEM_Reg        <=  ALU_result;
			read_data_2_EX_MEM_Reg       <=  read_data_2_ex;
			--Sign_extend_ID_EX_Reg        <=  Sign_extend;
			WReg_addr_EX_MEM_Reg         <=  WReg_addr;
			J_addr_EX_MEM_Reg            <=  J_addr;
			--------------------------------------------------------

			------------------- Control ----------------------------
			MemtoReg_EX_MEM_Reg  		 <=  MemtoReg_ID_EX_Reg;
			RegWrite_EX_MEM_Reg  		 <=  RegWrite_ID_EX_Reg;
			MemRead_EX_MEM_Reg  		 <=  MemRead_ID_EX_Reg;
			MemWrite_EX_MEM_Reg  		 <=  MemWrite_ID_EX_Reg;
			Zero_EX_MEM_Reg  			 <=  Zero;
			Branch_EX_MEM_Reg  			 <=  Branch_ID_EX_Reg;
			Jump_EX_MEM_Reg  			 <=  Jump_ID_EX_Reg;
			--------------------------------------------------------
			
			---------------- MEM/WB Register -----------------------
			------------------- DataPath ---------------------------
			PC_plus_4_MEM_WB_Reg         <=  PC_plus_4_EX_MEM_Reg;
			Instruction_MEM_WB_Reg       <=  Instruction_EX_MEM_Reg;
			read_data_MEM_WB_Reg         <=  read_data;
			ALU_result_MEM_WB_Reg        <=  ALU_result_EX_MEM_Reg;
			WReg_addr_MEM_WB_Reg         <=  WReg_addr_EX_MEM_Reg;
			--------------------------------------------------------
			
			------------------- Control ----------------------------
			MemtoReg_MEM_WB_Reg   		 <=  MemtoReg_EX_MEM_Reg;
			RegWrite_MEM_WB_Reg   		 <=  RegWrite_EX_MEM_Reg;
			Jump_MEM_WB_Reg   			 <=  Jump_EX_MEM_Reg;			
			--------------------------------------------------------					
			
	END PROCESS;

	PC_PROCESS:
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' ) AND (IF_IDwritedisable /= '1'); 	
			---------------- IF/ID Register ------------------------
			------------------- DataPath ---------------------------		
				IF IF_Flush = '1' THEN
					PC_plus_4_IF_ID_Reg      <=  "0000000000";
					Instruction_IF_ID_Reg    <=  X"00000000";
				ELSE 
					PC_plus_4_IF_ID_Reg      <=  PC_plus_4;
					Instruction_IF_ID_Reg    <=  Instruction;
				END IF;
			--------------------------------------------------------
		END PROCESS;

	
				
	
END structure;

