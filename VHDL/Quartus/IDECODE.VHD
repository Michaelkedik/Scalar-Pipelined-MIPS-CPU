						--  Idecode module (implements the register file for
LIBRARY IEEE; 			-- the MIPS computer)
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Idecode IS
	  PORT(	read_data_1_out	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2_out	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Instruction : IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			write_data_out 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALU_result	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			RegWrite 	: IN 	STD_LOGIC;
			MemtoReg 	: IN 	STD_LOGIC;
			Jump 		: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			Shift 		: IN 	STD_LOGIC;
			PC_plus_4_jal 	: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			PC_plus_4	: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
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
END Idecode;


ARCHITECTURE behavior OF Idecode IS
TYPE register_file IS ARRAY ( 0 TO 31 ) OF STD_LOGIC_VECTOR( 31 DOWNTO 0 );

	SIGNAL register_array				: register_file;
	SIGNAL write_register_address 		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_data					: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_register_1_address		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL read_register_2_address		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_register_address_1		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_register_address_0		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL Instruction_immediate_value	: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	SIGNAL Comparator 					: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Branch_Add					: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL read_data_1 					: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2 					: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Sign_extend 					: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	
	
	

BEGIN
	read_register_1_address 	<= Instruction( 25 DOWNTO 21 );
   	read_register_2_address 	<= Instruction( 20 DOWNTO 16 );
   	write_register_address_1	<= Instruction( 15 DOWNTO 11 );
   	write_register_address_0 	<= Instruction( 20 DOWNTO 16 );
   	Instruction_immediate_value <= Instruction( 15 DOWNTO 0 );
					-- Read Register 1 Operation
	read_data_1 <= 	register_array( CONV_INTEGER( read_register_2_address ) ) WHEN Shift = '1' ELSE
					register_array( CONV_INTEGER( read_register_1_address ) );
					-- Read Register 2 Operation		 
	read_data_2 <= register_array( 
			      CONV_INTEGER( read_register_2_address ) );
				  
	read_data_1_out <= read_data_1;
	read_data_2_out <= read_data_2;
				  		 
	write_register_address <= WReg_addr;						 
							 
					-- Mux to bypass data memory for Rformat instructions
	write_data <= ALU_result( 31 DOWNTO 0 ) WHEN ( MemtoReg = '0' and Jump = "00") ELSE
				  "0000000000000000000000" & PC_plus_4_jal WHEN Jump = "10" ELSE  
				  read_data;
					-- Sign Extend 16-bits to 32-bits
    Sign_extend <= X"0000" & Instruction_immediate_value
		WHEN Instruction_immediate_value(15) = '0'
		ELSE	X"FFFF" & Instruction_immediate_value;
		
	J_addr <= PC_plus_4(9) & Sign_extend(6 downto 0);
	
	write_data_out <= write_data; 
	
	----------------------------ADDED-------------------------------------------------------
	Instruction_20_16 <= read_register_2_address;
	Instruction_15_11 <= write_register_address_1;
	Instruction_10_6  <= Instruction(10 downto 6);
	
	Branch_Add	<= PC_plus_4( 9 DOWNTO 2 ) +  Sign_extend( 7 DOWNTO 0 ) ;
	Add_result 	<= Branch_Add( 7 DOWNTO 0 );
	
	Sign_extend_out <= Sign_extend;
	
	Comparator  <=  read_data_1 - read_data_2;
	
							-- Generate Zero Flag
	Zero <= '1' 
		WHEN ( Comparator( 31 DOWNTO 0 ) = X"00000000"  )
		ELSE '0';  
		
	----------------------------------------------------------------------------------------
		
PROCESS
	BEGIN
		WAIT UNTIL clock'EVENT AND clock = '0';
		IF reset = '1' THEN
					-- Initial register values on reset are register = reg#
					-- use loop to automatically generate reset logic 
					-- for all registers
			FOR i IN 0 TO 31 LOOP
				register_array(i) <= CONV_STD_LOGIC_VECTOR( i, 32 );
 			END LOOP;
					-- Write back to register - don't write to register 0
  		ELSIF (RegWrite = '1' AND write_register_address /= 0) THEN
		      register_array( CONV_INTEGER( write_register_address)) <= write_data;
		END IF;
	END PROCESS;
END behavior;


