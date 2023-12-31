-- Ifetch module (provides the PC and instruction 
--memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Ifetch IS
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
END Ifetch;

ARCHITECTURE behavior OF Ifetch IS
	SIGNAL PC, PC_plus_4 	 : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL next_PC, Mem_Addr : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL PCSrc             : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL en                : STD_LOGIC;
	
BEGIN
	en <= NOT(PCwritedisable);
						--ROM for Instruction Memory
inst_memory: altsyncram
	
	GENERIC MAP (
		operation_mode => "ROM",
		width_a => 32,
		widthad_a => 8,
		lpm_type => "altsyncram",
		outdata_reg_a => "UNREGISTERED",
		init_file => "C:\TestPrograms\ModelSlim\test\LAB5\ModelSim\L1_Caches\asm_ver1\my_program.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP (
		clock0     => clock,
		rden_a     => en,
		address_a 	=> Mem_Addr, 
		q_a 			=> Instruction );
					-- Instructions always start on word address - not byte
		PC(1 DOWNTO 0) <= "00";
					-- copy output signals - allows read inside module
		PC_out 			<= PC;
		PC_plus_4_out 	<= PC_plus_4;
						-- send address to inst. memory address register
		Mem_Addr <= Next_PC;
						-- Adder to increment PC by 4        
      	PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
       	PC_plus_4( 1 DOWNTO 0 )  <= "00";
		
		PCSrc    <= "01" WHEN ( (Branch = "01" AND Zero = '1') OR (Branch = "10" AND Zero = '0')) ELSE
					"10" WHEN (Jump = "01" OR Jump = "10") ELSE
					"11" WHEN Jump = "11" ELSE
					"00";
				 
		
						-- Mux to select Branch Address or PC + 4        
		Next_PC  <= X"00" WHEN Reset = '1' ELSE
			        Add_result  WHEN PCSrc = "01" ELSE 
					J_addr      WHEN PCSrc = "10" ELSE 
					"00" & read_data_1(7 downto 2)  WHEN PCSrc = "11" ELSE
					PC_plus_4( 9 DOWNTO 2 );		
					
		IF_Flush <= '0' WHEN PCSrc = "00" ELSE
					'1';
		
		
		
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   PC( 9 DOWNTO 2) <= "00000000" ; 
			ELSIF PCwritedisable /= '1' THEN
				   PC( 9 DOWNTO 2 ) <= next_PC;
			END IF;
	END PROCESS;
END behavior;
