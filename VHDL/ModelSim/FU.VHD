		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY FU IS
   PORT( 	
   	rs_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
	rt_ID_EX		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
	rd_EX_MEM		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
	rd_MEM_WB		    : IN 	STD_LOGIC_VECTOR(4 DOWNTO 0);
	RegWrite_EX_MEM		: IN 	STD_LOGIC;
	RegWrite_MEM_WB		: IN 	STD_LOGIC;
	FA, FB              : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)	
);

END FU;

ARCHITECTURE behavior OF FU IS

BEGIN       

	FA <= "10" WHEN RegWrite_EX_MEM = '1' AND rd_EX_MEM = rs_ID_EX ELSE
		  "01" WHEN RegWrite_MEM_WB = '1' AND rd_MEM_WB = rs_ID_EX ELSE 
		  "00";
		  
	FB <= "10" WHEN RegWrite_EX_MEM = '1' AND rd_EX_MEM = rt_ID_EX ELSE
		  "01" WHEN RegWrite_MEM_WB = '1' AND rd_MEM_WB = rt_ID_EX ELSE 
		  "00";
	
   END behavior;
