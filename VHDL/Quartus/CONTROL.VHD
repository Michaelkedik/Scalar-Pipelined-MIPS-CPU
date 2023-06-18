		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS
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

END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  R_format, Lw, Sw, Andi, Addi, Ori, Xori, Slti , Lui, Mul , Beq, Bne, Jal, Jr 	: STD_LOGIC;

BEGIN           
				-- Code to generate control signals using opcode bits
	R_format 	<=  '1'  WHEN  Opcode = "000000"  ELSE '0';
	Lw          <=  '1'  WHEN  Opcode = "100011"  ELSE '0';
 	Sw          <=  '1'  WHEN  Opcode = "101011"  ELSE '0';
	
	
	Beq         <=  '1'  WHEN  Opcode = "000100" ELSE '0';
	Bne         <=  '1'  WHEN  Opcode = "000101" ELSE '0';
	Branch      <=  "01" WHEN  Beq = '1'  ELSE   -- Beq
					"10" WHEN  Bne = '1'  ELSE   -- Bne
					"00";
	
  	RegDst    	<=  R_format OR Mul;
	MemtoReg 	<=  Lw;
  	RegWrite 	<=  (R_format AND NOT(Jr)) OR Lw OR Lui OR Addi OR Andi OR Ori OR Xori OR Slti OR Mul OR Jal;
  	MemRead 	<=  Lw;
   	MemWrite 	<=  Sw; 
	
	Shift       <= '1' WHEN (R_format = '1' AND (Function_opcode = "000000" OR Function_opcode = "000010" )) ELSE '0';
	
	ALUSrc  	<=  '1' WHEN Lw = '1' OR Sw = '1' OR Addi= '1' OR Andi ='1' OR Ori = '1' OR Xori ='1' OR Slti ='1' OR Lui ='1' ELSE
					'0';

	
	ALUOp   	<=  "000" WHEN R_format = '1' ELSE
					"001" WHEN Andi = '1' ELSE
					"010" WHEN Ori = '1' ELSE
					"011" WHEN Xori = '1' ELSE
					"100" WHEN Mul = '1' ELSE
					"101" WHEN Slti = '1' ELSE
					"110" WHEN (Beq = '1' OR Bne ='1') ELSE
					"111";
	
	Andi        <=  '1'  WHEN  Opcode = "001100"  ELSE '0';
	Addi        <=  '1'  WHEN  Opcode = "001000"  ELSE '0';
	Ori         <=  '1'  WHEN  Opcode = "001101"  ELSE '0';
	Xori        <=  '1'  WHEN  Opcode = "001110"  ELSE '0';
	Slti        <=  '1'  WHEN  Opcode = "001010"  ELSE '0';
	Lui         <=  '1'  WHEN  Opcode = "001111"  ELSE '0';
	
	Jal 		<=  '1' WHEN Opcode = "000011" ELSE '0';
	Jr 		    <=  '1' WHEN R_format = '1' AND Function_opcode = "001000" ELSE '0';	
	Jump        <=  "01"  WHEN  Opcode = "000010" ELSE  -- Jump
					"10" WHEN  Jal = '1' ELSE   -- Jal
					"11" When Jr = '1' ELSE  --Jr
					"00";
					
	Mul         <= 	'1'  WHEN  Opcode = "011100"  ELSE '0';


   END behavior;
