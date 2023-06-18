1)MIPS - The top entity, Synchronizes all the other components
2)IFETCH - Get the instruction and advance the PC according to the relevant adress
3)IDECODE - Decode the instruction and read and write from the register file
4)DMEMORY- Read or write from the data memory
5)EXECUTE- Performs all the logic or arithmetic actions
6)CONTROL - Produces the control signals that are needed for the instructions to be executed
7)HDU - Hazard Detection Unit, Detects dependencies between instructions and raise a stall signal when needed
8)FU - Forwarding Unit, Detects when forwarding is needed and raises control signals that are needed to decide which data will be used
	   in the ALU
